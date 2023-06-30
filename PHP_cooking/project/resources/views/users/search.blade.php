<!DOCTYPE html>

@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<html>
<head>
    <title>Search</title>
    <style>
        .hidden {
            display: none;
        }
    </style>
</head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Balthazar&display=swap" rel="stylesheet">

<link rel="stylesheet" href="{{asset('css/main.css')}}">

<body>

<div class="menubar">
    <h1> <img src="{{asset('img/cookit2.png')}}" height="180px"/> CookIT</h1>
    <a href="/search">Challenge search</a> &emsp;
    <a href="/received">Messages</a> &emsp;
    <a href="/challenge">Add challange</a> &emsp;
    <a href="/profile">My profile</a> &emsp;
    <a href="/logout">Logout</a>
</div>
<br>
<hr>

<div class="col-md-6">

    <h2>Find new challenge</h2>
    <p>Click on the submit button to take on new culinary challenges and meet other chefs!</p>

    @if($challenges->isEmpty())
        <p>No challenges found.</p>
    @else
        <div class="navigation-buttons">
            <button id="l" onclick="showPreviousChallenge()">Previous</button>
            <button id="p" onclick="showNextChallenge()">Next</button>

        </div>

        @foreach($challenges as $key => $challenge)
            <div class="card">
            <div class="challenge-details {{ $key === 0 ? '' : 'hidden' }}">
                <div class="col-md-4" >
                    <div class="info color">
                    <p class="pleft">Author:</p>
                    <p class="pright">{{ $challenge->Author }}</p>

                    <p class="pleft">Dish:</p>
                    <p class="pright">{{ $challenge->Dish }}</p>

                    <p class="pleft">Price:</p>
                    <p class="pright">{{ $challenge->Price }}</p>

                    <p class="pleft">Ingredients:</p>
                    <p class="pright">{{ $challenge->Ingredients }}</p>

                    <p class="pleft">Allergens:</p>
                    <p class="pright">{{ $challenge->Allergens }}</p>

                    <p class="pleft">Level:</p>
                    <p class="pright">{{ $challenge->Level }}</p>
                    </div>
                    <br><br><br>
                    <br>
                    <form method="POST" action="/sendId">
                        @csrf
                        <label for="id"></label><br>
                        <input type="hidden" id="id" name="id" value="{{ $challenge->id }}">
                        <button type="submit">Submit</button>
                    </form>
                    <br>
                </div>
            </div>
            </div>
        @endforeach


    @endif

    <script>
        var currentChallengeIndex = 0;
        var challengeDetails = document.querySelectorAll('.challenge-details');

        function showChallenge(index) {
            if (index >= 0 && index < challengeDetails.length) {
                challengeDetails.forEach(function (challenge) {
                    challenge.classList.add('hidden');
                });

                challengeDetails[index].classList.remove('hidden');
                currentChallengeIndex = index;
            }
        }

        function showNextChallenge() {
            var nextIndex = currentChallengeIndex + 1;
            showChallenge(nextIndex);
        }

        function showPreviousChallenge() {
            var previousIndex = currentChallengeIndex - 1;
            showChallenge(previousIndex);
        }



    </script>
</div>
</body>
</html>
