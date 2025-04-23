# Design and Development of a Mobile Application for Citizen Science-Based Landslide Observation and Data Collection

1. Introduction
    - Problem background: Importance of landslide data, challenges in data collection.
    - Role of citizen science.
    - Goals of the app.
    - Research questions (technical + conceptual).

2. Background 
    - insight geographical factors (monsoon region, deforestation, ...)

3. Related Work
    - Mobile data collection apps (e.g., iNaturalist, KoboCollect).
    - Technical aspects of mobile apps with offline/online sync.

4. System Specifications
    - hardware
        - device sensors (compass, tilt)
        - storage capacity (offline-maps, images, compression procedures, ...)
        - energy consumption (regarding upload (and later early warning system))
    - software
        - most common OS (iOS, Android)
        - UI/UX design goals: Accessibility, simplicity, effectiveness, general usabilty
    - constraints
        - network coverage
        - positioning in high mountains (GLSS)

5. Legal Claims
    - data collection in nepal
    - data storage in germany
    - GPS privacy

5. Implementation
    - Core features: Form, GPS, photo, offline saving.
    - Upload mechanism with retries.
    - Optional: code structure, important classes/methods.
    - Development challenges and solutions.

6. Evaluation
    - Functionality test cases.
    - Performance: Memory use, sync time.
    - Usability: Small user test or heuristic evaluation.
    - Limitations (e.g., GPS issues, photo compression trade-offs).

7. Discussion
    - What worked well, what was challenging.
    - adaption, scaling
    - Ethical/data privacy aspects in citizen science apps.

8. Conclusion & Outlook
    - Summary of findings.
    - Future work 
        - mapping interface
        - user accounts
        - multilingual support
        - transformation into early warning system
