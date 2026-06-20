# Full-Car Actuation Model and Analysis of Camber & Toe Variation on Vehicle Performance

An analytical and computer simulation framework developed in MATLAB & Simulink to study full-vehicle dynamics, suspension design, and wheel geometry variations. The project implements multi-DOF vehicle models incrementally—progressing from tire-slip physics to an actively actuated 10 Degrees of Freedom (DOF) full-car model utilizing anti-roll bar configurations.

---

## 📋 Project Overview
The primary objective of this project is to build a robust simulation environment capable of evaluating how suspension design and dynamic variations in wheel geometry (Toe and Camber) impact ride quality, handling characteristics, and tire wear. 

The framework isolates car body dynamics from high-frequency road inputs to minimize vertical acceleration transmitted to the sprung mass, incorporating analytical validation via Pacejka’s Magic Formula tire models.

### Core Architecture Capabilities
* **Tire Force Dynamics:** Implementation of Pacejka Magic Formula models for longitudinal and lateral force generation.
* **Incremental Dimensional Models:** Includes Quarter Car (2 DOF), Half Car Pitch/Roll (4 DOF), and a 2D plane Bicycle Model.
* **Full Car Actuation:** A comprehensive 10 DOF model that accounts for bounce, pitch, roll, yaw, lateral/longitudinal translations, and independent wheel vertical displacements.
* **Anti-Roll Control:** Integration of front axle anti-roll bar dynamics with a torsional stiffness of $30,000 \text{ N/m}$.

---

## 📁 Repository Structure

```text
├── config/
│   └── vehicle_params.m       # Sprung/unsprung mass, track width, and damping constants
├── src/
│   ├── tire_behaviour/        # Pacejka force curves plotting scripts
│   │   ├── longitudinal_force.m
│   │   └── lateral_force.m
│   ├── quarter_car/           # 2 DOF vertical dynamics simulation
│   │   └── quarter_car_model.slx
│   ├── half_car/              # 4 DOF localized ride/roll analysis
│   │   ├── half_car_pitch.slx
│   │   └── half_car_roll.slx
│   ├── bicycle/               # 2D plane straight-line transient checks
│   │   └── bicycle_model.slx
│   └── full_car/              # 10 DOF complete vehicle system equations
│       ├── full_car_actuation.slx
│       └── full_car_with_antiroll.slx
├── requirements.txt         
└── README.md