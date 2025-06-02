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
                   + "nomeFuncionario VARCHAR(100) NOT NULL)";
        Statement stmt = conexao.createStatement();
        stmt.execute(sql);
        stmt.close();
        System.out.println("Tabela 'Funcionarios' criada com sucesso!");
    }

    public void inserirFuncionario(String nome) throws Exception {
        String sql = "INSERT INTO Funcionarios (nomeFuncionario) VALUES (?)";
        PreparedStatement stmt = conexao.prepareStatement(sql);
        stmt.setString(1, nome);
        stmt.executeUpdate();
        stmt.close();
        System.out.println("Funcionário " + nome + " inserido com sucesso!");
    }
}
