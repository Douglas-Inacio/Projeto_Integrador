import java.sql.Connection;
import src.data_access.Funcionarios;
import src.data_access.DAO;

public class MainClass {
    public static void main(String[] args) {
        try {
            Connection conexao = DAO.getInstance().getConexao();
            System.out.println("Conexão realizada com sucesso!");

            Funcionarios funcionariosDAO = new Funcionarios(conexao);

            funcionariosDAO.criarTabelaFuncionarios();

            funcionariosDAO.inserirFuncionario("Cristiano Ronaldo");

            conexao.close();
            System.out.println("Conexão encerrada.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
