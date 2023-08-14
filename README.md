# Friendface

> PLEASE READ EVERYTHING BEFORE YOU START

## Project Description

Friendface, a totally legit social media platform, has some data
available and we want to run some analysis on it.

This part of the interview will be a take-home assignment, where
you’ll showcase your process and approach when it comes to working on
a realish-world feature/product - a small data analysis service.

This project should take about 2-4 hours – we know your time is
valuable, so if takes any longer than that, please cut it short and
just show us what you end up with in that time. Feel free to leave
notes telling us the amount of time you invested, where you stopped,
where you had challenges, what else you'd add or change if you had
more time, etc. We've provided an empty NOTES.txt for you to use for
that purpose.

## Instructions

* You've been added as a collaborator on our private project
  repository. Fulfill the requirements below.
* Use the following table to define the acceptable languages/platforms
  in connection to the team you are applying to.

| Team                                                  | Language(s) - priority order                                   |
|-------------------------------------------------------|----------------------------------------------------------------|
| Consumer Group (Order Ahead)                          | Ruby on Rails, Haskell, TypeScript on Node, or Clojure(Script) |
| Logistics Group (Delivery Experience)                 | Ruby on Rails or TypeScript on Node                            |
| Logistics Group (Procurement)                         | Python or TypeScript on Node                                   |
| Logistics Group (Routing)                             | Python or TypeScript on Node                                   |
| Marketplace Group (Merchandising and Recommendations) | TypeScript on Node or Ruby on Rails                            |
| Marketplace Group (Onboarding & Expansion)            | Ruby on Rails or TypeScript on Node                            |
| Marketplace Group (Pricing & Promotions - Money)      | Ruby on Rails or TypeScript on Node                            |
| Core Services Group (Services Acceleration)           | Ruby on Rails, Haskell, Clojure, or just surprise us           |
| Core Services Group (UX Acceleration & Identity)      | TypeScript on Node                                             |

## Base Requirements

* Friendface is a little behind the times so its API serves data in
  CSV instead of JSON. The accompanying
  [friendface.csv](friendface.csv) file contains data about the
  "likes" that your posts have received.

* Build an API over HTTP that provides these three features:

    * A way to get the day(s) of the week when you got the most
      "likes" (Monday, Tuesday, etc.)

    * A way to get all streaks of days when more likes were received
      than the day before (ignore days with no likes). For example, if
      you received 3 likes on 03/02, 4 likes on 03/05, 8 likes on
      03/06, and 7 likes on 03/09, then there was a single streak from
      03/02 to 03/06. Streaks should be at least 2 days long.

    * Provide functionality to enable a user to like one or more of
      your posts. You can assume the logged-in user is known via an
      HTTP header `X-User` (We won't evaluate you on the basis of
      authentication/authorization. Assume another identity system
      adds the user to the header in a safe way.)

* We've provided a CSV file with some data to be seeded into your
  solution (a fresh run of your solution should be initialized with
  the contents of the file.)

* Please provide working instructions for how to run your application
  and your tests. Do remember that the application will actually run
  on someone else’s machine.


## What will you be evaluated on

* Commits are part of the communication toolset for developers. We
  will be reviewing your solution commit-by-commit so make sure you
  have a series of smaller, cohesive commits that clearly and cleanly
  tell a story. Your fellow developers will consume your commit
  messages.

* Runnability and testability. Make sure your code runs safely and is
  testable. Your instructions to achieve this are mandatory. More
  advanced candidates should feel free to containerize their solutions
  or even host them with a "live demo" link.

* Whether your solution is correct and flexible enough to be extended
  or scaled in the future.

* Feel free to use any style of API for your external interface as
  long as it is over HTTP. More advanced candidates should be able to
  impress us with modern standards that they can show some mastery of.

* The actual schema of the data returned doesn’t really matter as long
  as it clearly represents the information your want to communicate
  and any client that might consume your API would have a blast doing
  so. More advanced candidates should be able to dive deeper into
  approaches for discoverability and documentation.

* If you are a beginner, you don't have to worry about utilizing any
  persistent store. In-memory databases or data structures are fine as
  long as they work well and corectly for the intents of this
  project. More advanced candidates should choose a reasonable means
  of persistence (remember, the solution has to run on someone else's
  computer.)

* The code must be readable and understandable (with clear naming and
  consistent code style). We will evaluate your organization, codebase
  structure and whether you made appropriate technical decisions and
  architectural patterns.

* Error prevention and handling.

## Submitting your assignment

1. Do your git hygiene (make sure your history is presentable.)

2. Add any notes to the NOTES.txt file that you see fit.

3. Open a PR for review.

4. Let us know by email when you're done and open a PR for
   review.

# From all at Odeko

> Good luck!
