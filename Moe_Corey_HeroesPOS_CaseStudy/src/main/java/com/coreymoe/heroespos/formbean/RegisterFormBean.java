package com.coreymoe.heroespos.formbean;

import com.coreymoe.heroespos.validation.EmailUnique;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.List;

@Getter
@Setter
@ToString
public class RegisterFormBean {

    private Integer id;

    @NotBlank(message = "First name is required.")
    private String firstName;

    @NotBlank(message = "Last name is required.")
    private String lastName;

    @Length(min = 3, max = 15, message = "Password must be between<br>3 and 15 characters")
    @NotBlank(message = "Password is required.")
    private String password;

    @NotBlank(message = "Confirm Password is required")
    private String confirmPassword;

    @EmailUnique(message = "Email exists")
    @NotBlank(message = "Email is required")
    @Pattern(regexp = "^[a-z0-9]+@[a-z]+\\.[a-z]{2,3}", message = "Email format invalid")
    private String email;

    @Pattern(regexp = "\\d{10}", message = "Phone number must contain a ten digit number")
    @NotNull(message = "Phone number is required.")
    private String phoneNumber;

    @NotBlank(message = "Address is required.")
    private String address;

    @NotBlank(message = "City is required.")
    private String city;

    @Pattern(regexp = "[a-zA-Z]{2}", message = "Enter two character state identifier")
    @NotBlank(message = "State is required.")
    private String state;

    @NotNull(message = "Zip code is required.")
    @Range(min = 501, max = 99950)
    private Integer zipCode;

    private List<String> fullNames;
}
