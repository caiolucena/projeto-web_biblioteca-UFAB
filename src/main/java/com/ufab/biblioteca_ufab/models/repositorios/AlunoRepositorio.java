package com.ufab.biblioteca_ufab.models.repositorios;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ufab.biblioteca_ufab.models.entidades.Aluno;

@Repository
public interface AlunoRepositorio extends CrudRepository<Aluno, Long> {
	
	@Query("SELECT a FROM Aluno a WHERE a.id NOT IN(SELECT e.aluno.id FROM Emprestimo e WHERE DATEDIFF(CURRENT_DATE(),e.data_devolucao) > 0 AND e.is_pendente = 1)")
	public List<Aluno> findByNaoPendentes();
	
	@Query("SELECT a FROM Aluno a WHERE a.id NOT IN(SELECT e.aluno.id FROM Emprestimo e WHERE DATEDIFF(CURRENT_DATE(),e.data_devolucao) < 0 AND e.is_pendente = 1) AND a.id = :id")
	public Optional<Aluno> findByIdAndPendente(@Param("id") Long id);

}
