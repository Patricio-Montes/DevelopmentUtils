package ar.com.toyota.webapi.services.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;



import ar.com.toyota.webapi.dtos.PatentsDTO;
import ar.com.toyota.webapi.entities.Patents;
import ar.com.toyota.webapi.repository.PatentsRepository;
import ar.com.toyota.webapi.services.PatentService;

@Service
public class PatentServiceImpl implements PatentService {

	@Autowired
	private PatentsRepository patentsRepository;
	
	@Override
	public List<PatentsDTO> getPatents(int page, int size) {
		Pageable pageWithElements = PageRequest.of(page, size);		
		Page<Patents> patentsEntities = patentsRepository.findAll(pageWithElements);	
		
        return patentsEntities.stream()
        	   .map(this::convertToDto)
        	   .collect(Collectors.toList());
	}
	
	private PatentsDTO convertToDto(Patents patentsToDto) {
		ModelMapper modelMapper = new ModelMapper();
		PatentsDTO patentsDto = modelMapper.map(patentsToDto, PatentsDTO.class);
	    return patentsDto;
	}
}
