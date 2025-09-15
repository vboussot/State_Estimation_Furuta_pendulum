# 🎛️ Furuta’s Pendulum – State Estimation and Control

This repository contains the full code, simulations, and report of my **Master project** on the **Furuta’s pendulum**.  
The focus is on **state estimation under sensor limitations** and the comparison of different observer and control strategies.

---

## 📖 Project Overview

- **System**: Furuta’s pendulum (nonlinear, unstable system)  
- **Objective**: Swing-up and stabilize the pendulum while estimating hidden states  
- **Challenge**: Limited/noisy measurements → need for robust state observers  

We explored both **model-free** and **model-based** estimation methods, combined with control strategies such as **swing-up + LQR stabilization**.

---

## 🔬 Methods Implemented

### Control
- Energy-based **swing-up**  
- **LQR (Linear Quadratic Regulator)** for stabilization

### State Estimation
- **Model-free**: numerical differentiation, filtering, sliding mode observer, super-twisting  
- **Model-based**: Luenberger observer, high-gain observer, homogeneous observer

---

## 📊 Results (Simulation)

- Successful **swing-up and stabilization** of the pendulum  
- Robustness tests with **sensor noise and perturbations**  
- Comparative analysis of observers in terms of:
  - Precision  
  - Robustness to noise  
  - Ease of tuning  

🔑 **Key Insights**  
- **Model-based observers** (high-gain, homogeneous) achieve the **highest accuracy** when the system model is reliable.  
- **Sliding-mode approaches** (e.g., Super-Twisting) provide **strong robustness to noise and disturbances**, making them suitable under uncertainty.  
- **Simple filtering methods** remain usable without a precise model, but they introduce delays and reduce responsiveness.  

--- 

## ℹ️ About

This project was coded in **MATLAB** using the **Control System Toolbox** and the **Simulink** for modeling and simulation.  
The full project report is available in the [`/Report`](./Report) folder.


