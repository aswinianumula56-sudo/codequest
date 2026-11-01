
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>CodeQuest - Home</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: linear-gradient(110deg, #140b27, #291044, #572092);
    color: white;
    min-height: 100vh;
}

/* Navbar */

.navbar {
    width: 100%;
    min-height: 75px;
    padding: 0 4%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: rgba(15, 7, 30, 0.55);
    border-bottom: 1px solid rgba(190, 80, 255, 0.25);
}

.logo {
    font-size: 27px;
    font-weight: bold;
    color: #c45cff;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 28px;
}

.nav-links a {
    text-decoration: none;
    color: white;
    font-size: 15px;
    transition: 0.3s;
}

.nav-links a:hover {
    color: #d16bff;
}

/* Hero section */

.hero {
    min-height: calc(100vh - 75px);
    padding: 35px 4% 25px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
}

.hero-content {
    width: 51%;
}

.hero-content h1 {
    font-size: clamp(38px, 4vw, 58px);
    line-height: 1.15;
    margin-bottom: 20px;
}

.hero-content h1 span {
    color: #c45cff;
}

.tagline {
    display: inline-block;
    padding: 14px 22px;
    margin-bottom: 23px;
    border: 1px solid #8c27d9;
    border-radius: 15px;
    background: rgba(130, 35, 190, 0.18);
    font-size: 20px;
    font-weight: bold;
}

.description {
    font-size: 18px;
    line-height: 1.7;
    color: #eee4ff;
    max-width: 700px;
    margin-bottom: 26px;
}

.get-started {
    display: inline-block;
    padding: 19px 42px;
    border-radius: 35px;
    text-decoration: none;
    color: white;
    font-size: 19px;
    font-weight: bold;
    background: linear-gradient(90deg, #a020f0, #7620d5);
    box-shadow: 0 0 25px rgba(183, 55, 255, 0.6);
    transition: 0.3s;
}

.get-started:hover {
    transform: translateY(-3px);
    box-shadow: 0 0 35px rgba(183, 55, 255, 0.9);
}

/* Features */

.features {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    max-width: 850px;
    margin-top: 35px;
}

.feature {
    text-align: center;
    padding: 12px 10px;
    border-right: 1px solid rgba(180, 60, 255, 0.4);
}

.feature:last-child {
    border-right: none;
}

.feature-icon {
    width: 65px;
    height: 65px;
    border: 1px solid #a536ed;
    border-radius: 17px;
    background: rgba(145, 48, 210, 0.15);
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 29px;
    margin: 0 auto 15px;
}

.feature h3 {
    font-size: 18px;
    margin-bottom: 10px;
}

.feature p {
    font-size: 14px;
    line-height: 1.5;
    color: #e7d9ff;
}

/* Increased Image Size */

.hero-image {
    width: 49%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.hero-image img {
    width: 100%;
    max-width: 680px;
    height: auto;
    object-fit: contain;
    display: block;
}

/* Responsive design */

@media (max-width: 900px) {

    .hero {
        flex-direction: column;
        text-align: center;
        padding-top: 45px;
    }

    .hero-content,
    .hero-image {
        width: 100%;
    }

    .description {
        margin-left: auto;
        margin-right: auto;
    }

    .features {
        margin: 35px auto 0;
    }

    .hero-image img {
        max-width: 550px;
    }
}

@media (max-width: 600px) {

    .navbar {
        height: auto;
        padding: 18px;
        flex-direction: column;
        gap: 15px;
    }

    .nav-links {
        gap: 13px;
        flex-wrap: wrap;
        justify-content: center;
    }

    .nav-links a {
        font-size: 13px;
    }

    .hero-content h1 {
        font-size: 38px;
    }

    .tagline {
        font-size: 15px;
    }

    .description {
        font-size: 15px;
    }

    .features {
        grid-template-columns: repeat(2, 1fr);
    }

    .feature {
        border-right: none;
        border-bottom: 1px solid rgba(180, 60, 255, 0.3);
    }

    .hero-image img {
        width: 100%;
        max-width: 450px;
    }
}
</style>
</head>

<body>

<!-- Navbar -->

<nav class="navbar">

    <div class="logo">CodeQuest</div>

    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="register.jsp">Register</a>
        <a href="login.jsp">Student Login</a>
        <a href="admin-login.jsp">Admin Login</a>
        <a href="<%= request.getContextPath() %>/leaderboard">
            Leaderboard
        </a>
    </div>

</nav>

<!-- Main Hero Section -->

<section class="hero">

    <div class="hero-content">

        <h1>
            Your Ideas.<br>
            <span>Your Code.</span><br>
            Your Future.
        </h1>

        <div class="tagline">
            🎮 Your Coding Adventure Starts Here!
        </div>

        <p class="description">
            Solve coding challenges, improve your programming skills,
            earn exciting rewards, unlock new achievements and track
            your progress — all in one place.
        </p>

        <a href="register.jsp" class="get-started">
            Get Started →
        </a>

        <!-- Features -->

        <div class="features">

            <div class="feature">
                <div class="feature-icon">⌨️</div>
                <h3>Explore</h3>
                <p>Learn Java, SQL, DSA and more.</p>
            </div>

            <div class="feature">
                <div class="feature-icon">🎯</div>
                <h3>Challenge</h3>
                <p>Solve coding questions.</p>
            </div>

            <div class="feature">
                <div class="feature-icon">🏆</div>
                <h3>Earn</h3>
                <p>Gain XP and unlock levels.</p>
            </div>

            <div class="feature">
                <div class="feature-icon">📊</div>
                <h3>Track</h3>
                <p>Monitor your progress.</p>
            </div>

        </div>

    </div>

    <!-- Only One Coding Girl Image -->

    <div class="hero-image">

        <img
            src="<%= request.getContextPath() %>/images/codequest-hero.png"
            alt="CodeQuest Coding Student">

    </div>

</section>

</body>
</html>
