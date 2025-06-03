package src.data_access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
//testandoDeNovo
public class Funcionarios {
    private Connection conexao;

    public Funcionarios(Connection conexao) {
        this.conexao = conexao;
    }

      package src.data_access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
//testandoDeNovo
public class Funcionarios {
    private Connection conexao;

    public Funcionarios(Connection conexao) {
        this.conexao = conexao;
    }

      public void criarTabelaFuncionarios() throws Exception {
        String sql = "CREATE TABLE IF NOT EXISTS Funcionarios ("
                   + "id INT AUTO_INCREMENT PRIMARY KEY, "
                   + "nomeFuncionario VARCHAR(100) NOT NULL, "
                   + "salario DECIMAL(10,2) NOT NULL, "
                   + "email VARCHAR(100) NOT NULL UNIQUE, "
                   + "nacionalidade VARCHAR(50) NOT NULL, "
                   + "cargo VARCHAR(50) NOT NULL, "
                   + "dataContratacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP)";
        try (Statement stmt = conexao.createStatement()) {
            stmt.execute(sql);
            System.out.println("Tabela 'Funcionarios' criada com sucesso!");
        }
    }

    public void inserirFuncionario(String nome, double salario, String email, String nacionalidade, String cargo) throws Exception {
        String sql = "INSERT INTO Funcionarios (nomeFuncionario, salario, email, nacionalidade, cargo) "
                   + "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, nome);
            stmt.setDouble(2, salario);
            stmt.setString(3, email);
            stmt.setString(4, nacionalidade);
            stmt.setString(5, cargo);
            stmt.executeUpdate();
            System.out.println("Funcionário " + nome + " inserido com sucesso!");
        }
    }
}
