package be.vdab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import be.vdab.dao.FiliaalDAO;
import be.vdab.entities.Filiaal;
import be.vdab.exceptions.FiliaalHeeftNogWerknemersException;
import be.vdab.valueobjects.PostcodeReeks;

@Service
@Transactional(readOnly = true)
class FiliaalServiceImpl implements FiliaalService {
	private final FiliaalDAO filiaalDAO;

	@Autowired
	FiliaalServiceImpl(FiliaalDAO filiaalDAO) {
		// Spring injecteert de parameter filiaalDAO
		// met de bean die de interface FiliaalDAO implementeert
		this.filiaalDAO = filiaalDAO;
	}

	@Transactional(readOnly = false)
	@Override
	public void create(Filiaal filiaal) {
		filiaalDAO.save(filiaal);
	}

	@Override
	public Filiaal read(long id) {
		return filiaalDAO.findOne(id);
	}

	@Transactional(readOnly = false)
	@Override
	public void update(Filiaal filiaal) {
		filiaalDAO.save(filiaal);
	}

	@Transactional(readOnly = false)
	@Override
	public void delete(long id) {
		Filiaal filiaal = filiaalDAO.findOne(id);
		if (filiaal != null) {
			if (!filiaal.getWerknemers().isEmpty()) {
				throw new FiliaalHeeftNogWerknemersException();
			}
			filiaalDAO.delete(id);
		}
	}

	@Override
	public Iterable<Filiaal> findAll() {
		return filiaalDAO.findAll(new Sort("naam"));
	}

	@Override
	public long findAantalFilialen() {
		return filiaalDAO.count();
	}

	@Override
	public Iterable<Filiaal> findByPostcodeReeks(PostcodeReeks reeks) {
		return filiaalDAO.findByAdresPostcodeBetweenOrderByNaamAsc(reeks.getVanpostcode(), reeks.getTotpostcode());
	}
}