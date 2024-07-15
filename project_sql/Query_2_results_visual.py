import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load your data
file_path = r'C:\Users\DELL\Desktop\SQL_PROJECT_DATA_JOB_ANALYSIS\project_sql\Query_2_results.csv'

data = pd.read_csv(file_path)

# Group the data by job title and aggregate the skills into a list for each job
grouped_data = data.groupby('job_title').agg({
    'salary_year_avg': 'first',
    'skills': lambda x: list(x)
}).reset_index()

# Remove duplicates from the skills list for each job title
grouped_data['skills'] = grouped_data['skills'].apply(lambda x: list(set(x)))

# Prepare data for visualization
job_titles = grouped_data['job_title']
salaries = grouped_data['salary_year_avg']
skills_list = grouped_data['skills']

# Flatten the skills data for a count plot
all_skills = [skill for sublist in skills_list for skill in sublist]

# Calculate the frequency of each skill
skills_series = pd.Series(all_skills).value_counts().head(10)

# Prepare data for visualization
top_skills = skills_series.index
skills_counts = skills_series.values

# Set up the matplotlib figure
plt.figure(figsize=(12, 8))

# Barplot for job titles and salaries in black and white
plt.subplot(2, 1, 1)
sns.barplot(x=salaries, y=job_titles, palette='Greys_r')
plt.title('Top-Paying Data Analyst Jobs and Their Average Salaries')
plt.xlabel('Average Salary ($)')
plt.ylabel('Job Title')

# Count plot for top skills in black and white
plt.subplot(2, 1, 2)
sns.barplot(x=skills_counts, y=top_skills, palette='Greys_r')
plt.title('Top 10 Skills in Top-Paying Data Analyst Jobs')
plt.xlabel('Count')
plt.ylabel('Skills')

plt.tight_layout()
plt.show()
