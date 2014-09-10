package be.vdab.dao;

import be.vdab.entities.Filiaal;

public interface FiliaalDAO {
	void create(Filiaal filiaal);

	Filiaal read(long id);

	void update(Filiaal filiaal);

	void delete(long id);

	Iterable<Filiaal> findAll();

	long findAantalFilialen();

	long findAantalWerknemers(long id);
}