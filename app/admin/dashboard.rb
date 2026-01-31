ActiveAdmin.register_page "Dashboard" do
  content do
    para "Welcome to Medical Management System"

    columns do
      column do
        panel "Users" do
          para "Manage doctors, nurses, patients"
        end
      end

      column do
        panel "Patients" do
          para "View and manage patients"
        end
      end
    end
  end
end
