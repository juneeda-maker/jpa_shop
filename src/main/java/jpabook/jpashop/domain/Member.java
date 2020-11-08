package jpabook.jpashop.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

@Entity
@Getter
@Setter
public class Member {

    @Id //pk를 명시적으로 표시(jpa 어노테이션)..
    @GeneratedValue

    private Long id;
    private String username;

}
