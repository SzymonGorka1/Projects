<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserDetail extends Model
{
    use HasFactory;



    public function updateLevel()
    {

        UserDetail::where('points', '>', 100)->update(['skills' => 1]);
        UserDetail::where('points', '>', 200)->update(['skills' => 2]);
        UserDetail::where('points', '>', 300)->update(['skills' => 3]);
        UserDetail::where('points', '>', 400)->update(['skills' => 4]);
        UserDetail::where('points', '>', 500)->update(['skills' => 5]);
        UserDetail::where('points', '>', 600)->update(['skills' => 6]);
        UserDetail::where('points', '>', 700)->update(['skills' => 7]);
        UserDetail::where('points', '>', 800)->update(['skills' => 8]);
        UserDetail::where('points', '>', 900)->update(['skills' => 9]);
        UserDetail::where('points', '>', 1000)->update(['skills' => 10]);

    }
}
