# 🌱 The Story of Git Branches

## 📖 Once Upon a Codebase…
At first, Uber only offered **cabs**.  
That stable code lived in the **main branch** — always up to date, always reliable.

One day, the product manager said:  
👉 “Let’s add **bikes**.”  
Developers didn’t want to break the cab code, so they created a **feature branch** called `feature/bikes`. They tested it, polished it, and once confident, merged it back into `main`.

Later, Uber decided:  
👉 “Let’s add **intercity travel**.”  
Again, a new **feature branch** was born, tested separately, and merged when ready.

After a few months, Uber was ready to ship a new version.  
To freeze the code for testing, they cut a **release branch** — `release-v3`. This branch was tested thoroughly and shipped to production.

But what if a bug appeared in production?  
👉 That’s where a **hotfix branch** came in. Developers quickly fixed the issue in `hotfix/critical-bug`, merged it into both `main` and the release branch, and delivered the patch to customers.

---

## 🧩 The Four Branch Types
- **Main/Master** → Stable, always up to date.  
- **Feature Branches** → For new features or experiments.  
- **Release Branches** → For preparing and shipping versions.  
- **Hotfix Branches** → For urgent production fixes.  

---

## 🧠 Key Lesson
Branches are like **parallel storylines** in your app’s journey.  
They let teams innovate without breaking what already works, and ensure customers always get stable, tested releases.

---

## 🔖 Hashtags
`#DevOpsJourney` `#GitBranching` `#VersionControl` `#ZeroToHero` `#LearningByDoing`
