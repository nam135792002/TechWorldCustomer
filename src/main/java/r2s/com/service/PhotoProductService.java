package r2s.com.service;

import java.util.List;

import r2s.com.models.PhotoProductEntity;

public interface PhotoProductService {
	PhotoProductEntity save(PhotoProductEntity photoProduct);
	List<PhotoProductEntity> findPhotoAvatar(int id, String avatar);
	void deleteByProductId(int idProduct);
}
