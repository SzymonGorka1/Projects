<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserDetail;
use Illuminate\Http\Request;
use App\Models\Challenge;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class ChallengeController extends Controller
{
    public function indexChallange()
    {

        if (!Auth::check()) {
            return redirect('/');
        }

        $userDetailUsername=User::where('id', Auth::id())->first();
        $challangeAuthor=Challenge::where('Author', $userDetailUsername->username)->get();
        return view('challenge', ['challangeAuthor' => $challangeAuthor]);
    }

    public function sendChallange(Request $request)
    {

        // Validate the request data
        $validatedData = $request->validate([
            'Dish' => 'required',
            'Price' => 'required|regex:/^(?!0\d)\d+(?:[.,]\d{1,2})?$/',
            'Ingredients' => 'required',
            'Allergens' => 'required',
            'Level' => 'required|integer|between:0,10',
            'Note' => 'required',
            'Challenger' => '',
            'Photo' => '',
            'Status' => '',
            'Review' => '',

        ]);

        $authorId = User::getUsernameofuser(Auth::id());
        $validatedData['Author'] = $authorId;
        $validatedData['Challenger'] = '';
        $validatedData['Photo'] = '/photos/food.jpg';
        $validatedData['Status'] = '';
        $validatedData['Review'] = '';


        Challenge::create($validatedData);

        return redirect('/challenge')->with('success', 'Challenge sent successfully.');
    }



    public function search()
    {
        if (!Auth::check()) {
            return redirect('/');
        }
        $challenges = DB::table('challenges')
            ->where('author', '!=', User::getUsernameofuser(Auth::id()))
            ->where('challenger', '')
            ->get();
        return view('users.search', compact('challenges'));
    }

    public function sendID(Request $request)
    {
        $challengeId = $request->input('id');

        Challenge::where('id', $challengeId)->update(['Challenger'=>User::getUsernameofuser(Auth::id())]);
        Challenge::where('id', $challengeId)->update(['Status'=>'In progress']);
        $data = Carbon::now();
        Challenge::where('id', $challengeId)->update(['StartDate'=>$data]);
        $data->addDay(7);
        Challenge::where('id', $challengeId)->update(['FinalDate'=>$data]);

        return redirect('/search');
    }


    public function sendReview(Request $request)
    {
        $challangeReview = $request->all();
        //echo print_r($challangeReview); die;

        $challengeId = $request->input('id');
        $request->validate([
            'Photo' => 'nullable|image',
            'Status' => '',
        ]);

        if($request->input('Review') == '')
        {
            $review = '-';
        }else{
            $review =$request->input('Review');
        }


        if ($request->has('Status') and $request->input("Challanger")!= ''){
            if( $request->input('Status') == 'Y'){
                //echo print_r($request->all());die;
                UserDetail::where('user_id',User::getUserIdByUsername($request->input('Challanger')))->increment('points', 10*($request->input('Level')+1));
                UserDetail::where('user_id',User::getUserIdByUsername($request->input('Challanger')))->first()->updateLevel();
            }else if( $request->input('Status') == 'N'){
                UserDetail::where('user_id',User::getUserIdByUsername($request->input('Challanger')))->decrement('points', 10*($request->input('Level')+1));
                UserDetail::where('user_id',User::getUserIdByUsername($request->input('Challanger')))->first()->updateLevel();
            }
        }
//        if ($request->input('Photo') != '') {
        if ($request->hasFile('Photo')){
            $path = $request->file('Photo')->store('public/photos');

            $challangeDetail = new Challenge();
            $challangeDetail->id = Auth::user()->id;
            $challangeDetail->Photo = $path;

            $newpath = substr($path, 6);
            $challangeDetail->update();
            Challenge::where('id', $challengeId)->update(['Status' => $challangeReview['Status'], 'Review' => $review, 'Photo' => $newpath, 'FinalDate' => Carbon::now()]);
            return redirect('/challenge')->with('success', 'Zdjęcie zostało dodane.');

        }
        else
        {
            $path = 'storage/photos/food.jpg';

            $challangeDetail = new Challenge();
            $challangeDetail->id = Auth::user()->id;
            $challangeDetail->Photo = $path;

            $newpath = substr($path, 8);
            $challangeDetail->update();
            Challenge::where('id', $challengeId)->update(['Status' => $challangeReview['Status'], 'Review' => $review, 'Photo'=> $newpath, 'FinalDate' => Carbon::now()]);
            return redirect('/challenge')->with('success', 'Zdjęcie zostało dodane.');

        }


    }




}
