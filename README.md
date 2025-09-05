# Repository Structure and File Descriptions

This project appears to focus on risk assessment and system reliability, particularly in aerospace and aircraft oxygen systems. It emphasizes methods like Reliability Block Diagram (RBD), Fault Tree Analysis (FTA), Monte Carlo Simulation (MCS), First-Order Reliability Method (FORM), and component importance measures (such as Birnbaum's measure and criticality). The repo includes implementations in Julia and Matlab, diagram images, analytical documents, and temporary files.

The repo lacks an official README or description, but based on file names and structure, it seems like an academic or research project for calculating system failure risks, with examples from aircraft (e.g., oxygen cylinders and Alaska Flight 261). I'll now detail the files directory by directory. (Note: Temp files are likely temporary or test files with no readable content; code files are described based on names and formats since exact content wasn't extracted, but names indicate their functionality.)

### 1. `Code` Directory (Source Code)
This is the main directory for the project's code, with subdirectories for different programming languages:

- **Julia** (Julia language for fast numerical computations):
  - `RBD.jl`: Script for modeling and calculating Reliability Block Diagram, which computes system failure risk based on series/parallel components.
  - `birnbaums.jl`: Implementation of Birnbaum's importance measure, showing how much a component impacts overall system reliability (useful for identifying weak points in risk assessment).
  - `criticality.jl`: Calculation of criticality importance, combining importance and component failure probability for risk prioritization.
  - `pr_1_2.jl`: Likely solves problems 1 and 2 of the project, such as basic risk calculations or simple simulations.
  - `pr_3.jl`: Solves problem 3, possibly more advanced simulations or sensitivity analysis.

- **Matlab** (Matlab for modeling and simulation):
  - `C_Normal.m`: Calculations for correlation or covariance in normal distributions, useful for probabilistic risk models.
  - `C_non_Normal.m`: Similar to above, but for non-normal distributions (e.g., log-normal or Weibull in failure models).
  - `C_non_Normal_m.m`: Modified version of the previous file, perhaps with changes in methods or parameters.
  - `Eq_normal.m`: Equations for normal distributions, likely for solving risk equations or optimization.
  - `Limit_State.m`: Definition and calculation of limit state function, used in reliability methods like FORM for failure probability.
  - `Q2.mlx`: Matlab live script for problem 2, possibly including code, charts, and explanations for Monte Carlo simulation.
  - `Q4.mlx`: Similar, for problem 4, likely related to oxygen vessels or cost analysis.
  - `RBD.m`: Similar to the Julia file, computes RBD for system reliability.
  - `birnbaums.m`: Birnbaum's importance implementation in Matlab.
  - `criticality.m`: Criticality calculation.
  - `pr_1_2.m`: Solves problems 1 and 2 in Matlab.
  - `pr_3.m`: Solves problem 3.

These codes are likely for numerical risk computations, failure simulations, and component importance analysis. They can be compared (Julia is faster, Matlab is more graphical).

### 2. `Figures` Directory (Images and Diagrams)
This directory contains images related to models and project results. All are JPG or PNG and used for risk visualization:

- `Actuator-DC-9.jpg`: Image of a DC-9 actuator, likely an example from aircraft systems.
- `Distribution & Delivery RBD.jpg`: RBD diagram for distribution and delivery (e.g., oxygen).
- `FORM.jpg`: Image of the FORM method for risk calculation.
- `FTA.jpg`: Fault Tree Analysis diagram for identifying failure causes.
- `MCS1.jpg` and `MCS2.png`: Monte Carlo simulation images, for failure probability distributions.
- `Most critical branch.jpg`: Critical branch in a tree or system.
- `Slide.jpg`: Likely a presentation slide.
- `Storage & Control RBD.jpg`: RBD for storage and control.
- `System RBD.jpg`: Overall system RBD.
- `User usage & detection RBD.jpg`: RBD for user usage and detection.
- `decision tree.png`: Decision tree for risk analysis.
- `first decision.jpg` and `second decision.jpg`: First and second decisions in the process.
- `thin-walled pressure vessels`: Likely an image of thin-walled pressure vessels, related to oxygen cylinders (full name incomplete, but inferred from context).

These images illustrate models and results, such as system diagrams and simulation outputs.

### 3. `doc` Directory (Documents and Reports)
This contains the project's main documents, mostly DOCX, PDF, and XLSX for analysis and reporting:

- `Aircraft Oxygen Cylinders.docx`: Explanation of aircraft oxygen cylinders.
- `Estimating human error rates in the aerospace industry.docx`: Estimating human error rates in aerospace.
- `FMECA.docx`: Failure Modes, Effects, and Criticality Analysis.
- `Failure Rate for RBD.xlsx`: Table of failure rates for RBD (input data for codes).
- `Probabilistic_Safety_Assessment_of_Aircraft_Crew_Oxygen_Systems.docx` and `.pdf`: Probabilistic safety assessment of aircraft crew oxygen systems (core of the project).
- `Q_2_MC.docx`: Problem 2 with Monte Carlo.
- `Q_4_oxygen_vessel.docx`: Problem 4 on oxygen vessels.
- `REL2025.PRJ.BSc.pdf`: Reliability project report for BSc 2025.
- `alaska flight 261.pdf`: Report on Alaska Flight 261 incident (real-world risk example).
- `face mask redundancy.docx`: Redundancy in face masks (for oxygen systems).
- `inspection cost.docx`: Inspection costs in risk management.

These files cover theoretical analysis, data, and reports. PDFs are likely final versions, DOCX are editable.

### 4. `References` Directory (References)
- `tempt`: Temporary file, no readable content (likely a placeholder).

### 5. `Results` Directory (Results)
- `temp`: Temporary file, no content.

### 6. `ppt files` Directory (Presentation Files)
- `temp`: Temporary file, no content.

### 7. Root Files
- `github.txt`: Text file, but no readable content (possibly empty or for testing).

### Overall Summary
- **Project Focus**: Risk assessment of aircraft safety systems (especially oxygen), with tools like RBD, FTA, MCS, and importance measures. Codes for numerical computations, images for visualization, documents for explanations and data.
- **Suggestions**: Add a README with explanations, license, and code execution guide. If codes have dependencies (e.g., Julia libraries or Matlab toolboxes), mention them.
- If you need more details on file contents (e.g., exact code or PDF text), I can try examining with other tools, but based on the current review, this description is complete. Let me know if you have questions!
