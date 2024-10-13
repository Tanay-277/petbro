<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetBro - Dashboard</title>
    <link href="https://api.fontshare.com/v2/css?f[]=satoshi@1&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'satoshi', sans-serif;
            background: #000;
            color: #eee;
            width: 100%;
            min-height: 100vh;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.5rem;
            background: #000;
        }

        .border-one {
            border: 0.1px solid #ffffff20;
        }

        .mid {
            border-radius: 32px;
            font-weight: 500;
            background: #ffffff20;
        }

        .mid a {
            color: #fff;
            text-decoration: none;
            padding: 0.8em 1.2em;
            border-radius: 32px;
            width: 7rem;
            text-align: center;
            transition: color 0.3s ease;
        }

        .mid a.active {
            background: #ffffff;
            color: black;
            font-weight: bold;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1.5rem;
            padding: 2rem;
        }

        .card {
            padding: 1.5rem;
            border-radius: 20px;
            background: #ffffff12;
            border: 1px solid #ffffff10;
            display: flex;
            flex-direction: column;
            gap: 1rem;
            color: #fff;
            position: relative;
            overflow: hidden;
        }

        .card-title {
            font-size: 1.3rem;
            font-weight: bold;
        }

        /* AI Suggestion Card - With Special Icon */
        .ai-suggestion {
            grid-column: span 2;
        }


        /* Nutrition Tip Card with Horizontal Graph and Labels */
        .nutrition-tip {
            grid-column: span 1;
        }

        .graph-container {
            display: flex;
            justify-content: space-between;
            gap: 0.3rem;
            margin-top: 0.5rem;
        }

        .graph-bar {
            height: 8px;
            border-radius: 4px;
            position: relative;
        }

        .protein-bar {
            background-color: #6a0dad;
            width: 50%;
        }

        .veg-bar {
            background-color: #32cd32;
            width: 30%;
        }

        .grain-bar {
            background-color: #ffd700;
            width: 20%;
        }

        .graph-label {
            font-size: 0.8rem;
            margin-top: 0.25rem;
            text-align: center;
            font-weight: 600;
        }

        /* Health Summary - Circular Progress Chart */
        .health-summary {
            display: flex;
            justify-content: space-between;
            align-items: center;
            grid-column: span 1;
        }

        .progress-circle {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: conic-gradient(#00ff88 70%, #ffffff15 70%);
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            font-weight: bold;
            font-size: 1.1rem;
        }

        /* Upcoming Session - Special Countdown */
        .upcoming-session {
            position: relative;
            grid-column: span 1;
        }

        .countdown {
            font-size: 1.2rem;
            font-weight: bold;
            color: #00ff88;
            margin-top: 0.75rem;
        }


        /* Recent Activities & Events with Icons */
        .recent-activities, .upcoming-events {
            grid-column: span 1;
            position: relative;
        }

        .recent-activities ul, .upcoming-events ul {
            list-style-type: none;
            padding: 0;
        }


    </style>
</head>
<body>
<header class="sticky top-0 z-50">
    <div class="left">
        <h1 class="text-2xl font-bold">PetBro</h1>
    </div>
    <div class="mid flex gap-4">
        <a href="#" class="active">Overview</a>
        <a href="#">Family</a>
        <a href="${pageContext.request.contextPath}/events">Sessions</a>
        <a href="#">More</a>
    </div>
    <div class="right">
        <img src="images/user.jpeg" alt="Profile" class="rounded-full w-12 border-one">
    </div>
</header>

<section class="grid-container">
    <!-- AI Suggestion Card with Special Icon -->
    <div class="card ai-suggestion">
        <div class="card-title">AI Suggestion for Max</div>
        <p>Max seems to enjoy his morning runs! Consider adding more protein to his diet for optimal recovery.</p>
    </div>

    <!-- Upcoming Session with Countdown Timer -->
    <div class="card upcoming-session">
        <div class="card-title">Upcoming Session</div>
        <p>Next grooming session for Bella: <strong>Oct 10, 2024</strong></p>
        <div class="countdown">5 days remaining</div>
    </div>

    <!-- Nutrition Tip Card with Horizontal Graph and Labels -->
    <div class="card nutrition-tip">
        <div class="card-title">Nutrition Tip</div>
        <p>Feed your dog a balanced diet</p>
        <div class="graph-container">
            <div class="graph-bar protein-bar"></div>
            <div class="graph-bar veg-bar"></div>
            <div class="graph-bar grain-bar"></div>
        </div>
        <div class="graph-label">
            <span>Protein 50%</span> | <span>Veggies 30%</span> | <span>Grains 20%</span>
        </div>
    </div>

    <!-- Health Summary with Circular Progress Chart -->
    <div class="card health-summary">
        <div class="card-title">Health Summary</div>
        <p>Max is in great shape! Weight: <strong>22kg</strong>. Activity: <strong>High</strong>. Vaccination due:
            <strong>Next Month</strong>.</p>
        <div class="progress-circle">70%</div>
    </div>

    <!-- Recent Activities Card with Icons
    <div class="card recent-activities">
        <div class="card-title">Recent Activities</div>
        <ul>
            <li>Grooming session booked for Max.</li>
            <li>New vet visit added for Bella.</li>
        </ul>
    </div>
-->
    <!-- Upcoming Events Card with Icons -->
    <div class="card upcoming-events">
        <div class="card-title">Upcoming Events</div>
        <ul>
            <li>Join us for the annual Pet Day on <strong>Nov 20, 2024</strong>.</li>
            <li>Exciting offers and fun activities!</li>
        </ul>
    </div>
</section>
</body>
</html>
