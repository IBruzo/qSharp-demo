namespace CircuitoEjemplo {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;

    @EntryPoint()
    operation Circuito() : Result {

        // Qubits en el mismo orden que el diagrama:
        // q0: |0>
        // q1: |1>
        // q2: |0>
        // q3: |1>
        use q0 = Qubit();      // empieza en |0⟩
        use q1 = Qubit();      // lo ponemos en |1⟩
        use q2 = Qubit();      // empieza en |0⟩
        use q3 = Qubit();      // lo ponemos en |1⟩

        // Preparar |1> en q1 y q3
        X(q1);
        X(q3);

        // --- Puertas del circuito ---
        H(q0);        // Hadamard en la primera línea
        Z(q1);        // Z en la segunda línea

        // Control desde q1 hacia q2
        // Toffoli (CCNOT)
        Controlled X([q0, q1], q2);


        // Hadamard en el cuarto qubit
        H(q3);

        // Medición del qubit q2 (como en la imagen)
        let res = M(q2);

        // Reset de todos los qubits antes de liberar
        Reset(q0);
        Reset(q1);
        Reset(q2);
        Reset(q3);

        return res;
    }
}
