package com.example.demo.controller;

import java.security.Principal;
import java.util.List;
import com.example.demo.dao.AppRoleDAO;
import com.example.demo.dao.AppUserDAO;
import com.example.demo.dao.CalendarDAO;
import com.example.demo.dao.ProjectDAO;
import com.example.demo.dao.SendAssumeDAO;
import com.example.demo.dao.WorkoutDAO;
import com.example.demo.model.AppUser;
import com.example.demo.model.Calendar;
import com.example.demo.model.Project;
import com.example.demo.model.WorkoutModel;
import com.example.demo.utils.WebUtils;
import com.example.demo.utils.EncrytedPasswordUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@Autowired
	private AppUserDAO appUserDAO;
	
	@Autowired
	private WorkoutDAO workoutDAO;
	
	@Autowired
	private ProjectDAO projectDAO;
	
	@Autowired
	private SendAssumeDAO assumeDAO;
	
	@Autowired
	private CalendarDAO calendarDAO;
	
	@Autowired
	private AppRoleDAO appRoleDAO;
	
	private List<Project> forAssumeProjects;
	private List<AppUser> forAssumeWorkers;
	
	
	//Welcome Page
	@RequestMapping(value= {"/","welcome"}, method=RequestMethod.GET)
	public String welcomePage(Model model)
	{
		model.addAttribute("title", "◄►_◄► Welcome ◄►_◄►");
		model.addAttribute("message", "This is welcome page!!!");
		model.addAttribute("continue", "To continue, please, ");

		return "welcomePage";
	}
	
	//Open Calendar
	@RequestMapping(value="/Calendar", method = RequestMethod.GET)
	public String showCalendar(Model model)
	{
		List<Calendar> calendar = calendarDAO.getCalendar();
		model.addAttribute("Calendar", calendar);
		
		return "calendar";
	}	
	
	//The page for Manager
	@RequestMapping(value="/management", method=RequestMethod.GET)
	public String managementPage(Model model)
	{
		List<WorkoutModel> workoutsList = workoutDAO.getWorkoutsList();
		model.addAttribute("workoutsList", workoutsList);
		
		List<Project> projectsList = projectDAO.getProjectsList();
		model.addAttribute("projectsList", projectsList);
		
		return "managerPage";
	}
	
	//The page for manager to assume work hours
	@RequestMapping(value="/assume", method=RequestMethod.GET)
	public String assumeInfo(Model model)
	{		
		List<WorkoutModel> workoutsList;// = workoutDAO.getWorkoutsList();
		
		List<Project> projectsList = projectDAO.getProjectsList();
		
		List<AppUser> workersList = appUserDAO.getWorkersList();
		
		for(AppUser worker : workersList)
		{
			workoutsList = workoutDAO.findWorkoutByWorkerId(worker.getUserId());
			if(!workoutsList.isEmpty())
			{
				for(WorkoutModel workout : workoutsList)
				{
					worker.changeHours(workout.getSpent_Hours());
				}
			}
			else
			{
				continue;
			}
		}			
		for(Project project : projectsList)
		{
			workoutsList = workoutDAO.findWorkoutByProjectId(project.getProject_Id());
			if(!workoutsList.isEmpty())
			{
				for(WorkoutModel workout : workoutsList)
				{
					project.changeHours(workout.getSpent_Hours());
				}
			}
			else
			{
				continue;
			}
		}			
		this.forAssumeProjects = projectsList;
		this.forAssumeWorkers = workersList;
		
		model.addAttribute("workers", workersList);
		model.addAttribute("projects", projectsList);
		
		 return "assumeForm";
	}
	
	//Send the assumed information to the database
	@RequestMapping(value="/sendAssume", method = RequestMethod.GET)
	public String sendAssume()
	{
		assumeDAO.updateProjectsAssume(forAssumeProjects);
		assumeDAO.updateWorkersAssume(forAssumeWorkers);
		return "projectsList";
	}
	
	//Show workers list
	@RequestMapping(value="/workers", method = RequestMethod.GET)
	public String workersList(Model model)
	{
		List<AppUser> list = appUserDAO.getWorkersList();
		model.addAttribute("workers", list);
		
		return "workersList";
	}
	
	//open the addWorker page
	@RequestMapping(value="/addWorker", method=RequestMethod.GET)
	public String openAddWorkerPage(Model model)
	{
		AppUser worker = new AppUser();
		model.addAttribute("worker", worker);
		return "addWorkerPage";
	}
	
	//save new worker
	@RequestMapping(value="/addWorker", method=RequestMethod.POST)
	public String addWorker(Model model, @ModelAttribute("worker") AppUser worker)
	{
		String encryptedPassword = EncrytedPasswordUtils.encryptePassword(worker.getEncrytedPassword());
		worker.setEncrytedPassword(encryptedPassword);
		appUserDAO.addWorker(worker.getUserId(), worker.getUserName(), worker.getEncrytedPassword());
		appRoleDAO.createRole(worker.getUserId(), worker.getRole());
		
		return "welcomePage";
	}
	
	//worker updates his hours record
	@RequestMapping(value="/hoursUpdate/{id}/{hours}")
	public String updateWorkout(@PathVariable("id") Long workout_id, @PathVariable("hours") Integer hours)
	{
		WorkoutModel workout = workoutDAO.findWorkoutById(workout_id);
		workoutDAO.updateWorkoutHours(workout, hours);
		return "welcomePage";
	}
	
	//show worker info
	@RequestMapping(value="/workerInfo/{id}", method = RequestMethod.GET)
	public String workerInfo(@PathVariable("id") long worker_id,Model model)
	{
		if(worker_id!=0)
		{
			AppUser worker = appUserDAO.findUserById(worker_id);
			model.addAttribute("worker", worker);
			List<WorkoutModel> workoutList = workoutDAO.findWorkoutByWorkerId(worker_id);
			model.addAttribute("workoutList", workoutList);
			return "workerInfoPage";
		}
		
		return "workersList";
	}
	
	//show current user info
	@RequestMapping(value="/userInfo", method = RequestMethod.GET)
	public String currentUserInfo(Model model, Principal principal)
	{
		// After user login successfully.
		String userName = principal.getName();
		System.out.println("User Name: " + userName);//В консоль
		AppUser user = appUserDAO.findUserAccount(userName);//Тот же юзер, но для получения всех его данных.(Princiapl предоставляет только данные, необходимые для security)
		
		User loginedUser = (User) ((Authentication) principal).getPrincipal();
		
		String userInfo = WebUtils.toString(loginedUser);
		
		List<WorkoutModel> workoutList = workoutDAO.findWorkoutByWorkerId(user.getUserId());
			
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("userObject", user);
		model.addAttribute("workoutList", workoutList);

		return "userInfoPage";
	}
	
	//show projects list
	@RequestMapping(value="/projects", method = RequestMethod.GET)
	public String projectsList(Model model)
	{
		List<Project> projects = projectDAO.getProjectsList();
		model.addAttribute("projectsList", projects);
		return "projectsList";
	}
	
	//open addProject page
	@RequestMapping(value="/addProject", method=RequestMethod.GET)
	public String openAddProjectPage(Model model)
	{
		Project project = new Project();
		model.addAttribute("project", project);
		return "addProjectPage";
	}
	
	//save new project
	@RequestMapping(value="/addProject", method=RequestMethod.POST)
	public String addProject(Model model, @ModelAttribute("project") Project project)
	{
		projectDAO.addProject(project.getProject_Id(), project.getProject_Name());
		return "welcomePage";
	}
	
	//open addWorkout page
	@RequestMapping(value="/addWorkout", method=RequestMethod.GET)
	public String openAddWorkoutPage(Model model)
	{
		WorkoutModel workout = new WorkoutModel();
		model.addAttribute("workout", workout);
		return "addWorkoutPage";
	}
	
	//save new workout
	@RequestMapping(value="/addWorkout", method=RequestMethod.POST)
	public String addWorkout(Model model, @ModelAttribute("workout") WorkoutModel workout)
	{
		workoutDAO.createWorkout(workout.getUser_Id(), workout.getProject_Id(), workout.getProject_Name());
		return "welcomePage";
	}
	
	//project info
	@RequestMapping(value="/projectInfo/{id}", method = RequestMethod.GET)
	public String projectInfo(@PathVariable("id") long project_id, Model model)
	{
		if(project_id!=0)
		{
			Project project = projectDAO.findProjectById(project_id);
			model.addAttribute("project", project);
			List<WorkoutModel> workoutList = workoutDAO.findWorkoutByProjectId(project_id);
			model.addAttribute("workoutList", workoutList);
			return "projectInfo";
		}
		return "projectsList";
	}
	
	//login page
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginPage(Model model)
	{
		return "loginPage";
	}
	
	//logout page
	@RequestMapping(value="/logoutSuccessful", method = RequestMethod.GET)
	public String logoutSuccessfulPage(Model model)
	{
		model.addAttribute("title", "Logout");
		return "logoutSuccessfulPage";
	}
	
	//error page - if there is a problem with permission
	@RequestMapping(value="/403", method=RequestMethod.GET)
	public String accessDenied(Model model, Principal principal)
	{
		if(principal!=null)
		{
			User loginedUser = (User)((Authentication) principal).getPrincipal();
			
			String userInfo = WebUtils.toString(loginedUser);
			
			model.addAttribute("userInfo", userInfo);
			
			String message = "Hi " + principal.getName() + "<br> You do not have permission to access this page!";
			model.addAttribute("message", message);
		}		
		return "403Page";
	}
	
}
