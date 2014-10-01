package be.vdab.restservices;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.hateoas.config.EnableEntityLinks;

@EnableEntityLinks
@Configuration
@ComponentScan(basePackageClasses = CreateRestControllerBeans.class)
public class CreateRestControllerBeans {
}
