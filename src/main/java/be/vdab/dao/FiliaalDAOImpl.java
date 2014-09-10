package be.vdab.dao;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Repository;

import be.vdab.entities.Filiaal;
import be.vdab.valueobjects.Adres;

@Repository
// met deze annotation maak je een Spring bean van deze class
class FiliaalDAOImpl implements FiliaalDAO {
	// Je gebruikt voorlopig geen relationele database,
	// maar een Map (in het interne geheugen)
	private final Map<Long, Filiaal> filialen = new ConcurrentHashMap<>();

	FiliaalDAOImpl() {
		filialen.put(1L, new Filiaal(1, "Andros", true, new BigDecimal(1000), new Date(), new Adres("Keizerslaan", "11", 1000, "Brussel")));
		filialen.put(2L, new Filiaal(2, "Delos", false, new BigDecimal(2000), new Date(), new Adres("Gasthuisstraat", "31", 1000, "Brussel")));
		filialen.put(3L, new Filiaal(3, "Gavdos", false, new BigDecimal(3000), new Date(), new Adres("Koestraat", "44", 9700, "Oudenaarde")));
	}

	@Override
	public void create(Filiaal filiaal) {
		// simulatie autonummering: nr. nieuwe filiaal=grootste nr. alle
		// filialen+1
		filiaal.setId(Collections.max(filialen.keySet()) + 1);
		filialen.put(filiaal.getId(), filiaal);
	}

	@Override
	public Filiaal read(long id) {
		return filialen.get(id);
	}

	@Override
	public void update(Filiaal filiaal) {
		filialen.put(filiaal.getId(), filiaal);
	}

	@Override
	public void delete(long id) {
		filialen.remove(id);
	}

	@Override
	public Iterable<Filiaal> findAll() {
		return filialen.values();
	}

	@Override
	public long findAantalFilialen() {
		return filialen.size();
	}

	@Override
	public long findAantalWerknemers(long id) {
		// dummy implementatie: filiaal 1 bevat 7 werknemers, de andere filialen
		// 0
		return id == 1L ? 7L : 0L;
	}
}
