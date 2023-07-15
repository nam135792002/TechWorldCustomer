package r2s.com.dto;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import r2s.com.models.CustomerEntity;

public class UserDetailsDTO implements UserDetails{
	
	private CustomerEntity customerEntity;
	
	// contructor
	public UserDetailsDTO(CustomerEntity customerEntity) {
		this.customerEntity= customerEntity;
	}

	public CustomerEntity getUsecase() {
		return customerEntity;
	}

	public void setUsecase(CustomerEntity customerEntity) {
		this.customerEntity = customerEntity;
	}
	
	public CustomerEntity getUser() {
		return customerEntity;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return customerEntity.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return customerEntity.getEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

}