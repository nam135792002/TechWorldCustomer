package r2s.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import r2s.com.models.PhotoProductEntity;
import r2s.com.reponsitory.PhotoProductReponsitoty;

@Service
@Transactional
public class PhotoProductServiceImp implements PhotoProductService{
	
	@Autowired
	private PhotoProductReponsitoty photoProductReponsitoty;

	@Override
	public PhotoProductEntity save(PhotoProductEntity photoProduct) {
		return photoProductReponsitoty.save(photoProduct);
	}

	@Override
	public List<PhotoProductEntity> findPhotoAvatar(int id, String avatar) {
		return photoProductReponsitoty.findPhotoAvatar(id, avatar);
	}

	@Override
	public void deleteByProductId(int idProduct) {
		photoProductReponsitoty.deleteByProductId(idProduct);
	}
	
}
