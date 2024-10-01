# TINY-ML-for-FOC-of-PMSM-20092024
PI(D) output correction using Tiny NN

Permanent Magnet Synchronous Motors (PMSMs) are highly efficient, fast rotating, and reliable brushless motors, making them ideal for high-performance applications like electric vehicles, industrial robots, and machine tools. Despite their advantages, PMSM control remains a challenging area of research, particularly during abrupt speed transitions. Traditional Filed oriented control (PID-based) methods for plant linearization have shown limited success, and while Non-Linear Model Predictive Control (NLMPC) is theoretically optimal, its complexity makes on-device implementation impractical. This research project done in System Research and Development with Danilo Pau (danilo.pau@st.com) focuses on improving PMSM control by integrating a tiny neural network with a PI(D) controller to enhance speed tracking performance. The neural network, developed and integrated in the Simulink model, corrects the reference quadrature current, mitigating overshoots and undershoots during speed transitions. After training, the model is optimized in Matlab (hyper parameter optimization, pruning) for deployment on STM32 and Stellar-E families of micro-controllers by using the ST Edge AI Unified Core Technology https://www.st.com/en/development-tools/stedgeai-core.html integrated into the ST Edge AI Developer Cloud https://stm32ai-cs.st.com/home , to allow automated and optimal deployment thus ensuring it is suitable for real-time application with minimal computational and memory overhead. Future work will explore replacing the dual PI(D) controllers with a single neural network to directly output reference voltages, further advancing PMSM control strategies.
