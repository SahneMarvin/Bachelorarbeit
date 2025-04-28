# Design and Development of a Mobile Application for Citizen Science-Based Landslide Observation and Data Collection

1. Introduction
    - insight geographical factors (monsoon region, deforestation, ...)
    - problem background: Importance of landslide data, challenges in data collection.
    - role of citizen science and goals of the app
    - research questions

2. Related Work
    - Mobile data collection apps (e.g., iNaturalist, KoboCollect).
    - Technical aspects of mobile apps with offline/online sync.

3. System Specifications
    - hardware
        - device sensors (compass, tilt)
        - storage capacity (offline-maps, images, compression procedures, ...)
        - energy consumption (regarding upload (and later early warning system))
    - software
        - most common OS (iOS, Android)
        - UI/UX design goals: Accessibility, simplicity, effectiveness, general usabilty
    - constraints and considerations
        - network coverage
        - positioning in high mountains (GLSS)
        - unified format of timestamps

4. Implementation
    - Core features: Form, GPS, photo, offline saving.
    - Upload mechanism with retries.
    - Optional: code structure, important classes/methods.
    - Development challenges and solutions.

5. Evaluation
    - Functionality test cases.
    - Performance: Memory use, sync time.
    - Usability: Small user test or heuristic evaluation.
    - Limitations (e.g., GPS issues, photo compression trade-offs).

6. Discussion
    - What worked well, what was challenging.
    - adaption, scaling
    - Ethical/data privacy aspects in citizen science apps.

7. Conclusion & Outlook
    - Summary of findings.
    - Future work 
        - mapping interface
        - user accounts
        - multilingual support
        - transformation into early warning system



## Usage of App

``` mermaid
    flowchart TD
    A[start app]
    B[report new landslide]
    C[choose location]
    D[take a picture]
    E["set date of landslide (autofilled with current date)"]
    F["send report (with confirmation)"]
    G[compress and save image]
    H[try uploading]
    I[alert: 'will be uploaded once connection is reestablished']
    J[upload-retry-loop]
    K[alter or notification of success]

    A --> B --> C --> D --> E --> F --> G --> H
    H --> |fails| I
    I --> J --> K
    H --> |success| K
```