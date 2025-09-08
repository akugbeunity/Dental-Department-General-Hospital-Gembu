PROJECT OVERVIEW			  																							

Oral health is an important but often neglected and inaccessible aspect of healthcare in most rural communities in Nigeria. General Hospital Gembu located in the Mambilla Plateau in Taraba State, Nigeria serves as the main referral center for dental cases in the region. The Hospital provides essential services such as extraction, filling, scaling, denture construction and is able to manage some specialized oral health cases. However more complex or critical conditions are referred to tertiary hospital due to resource limitation. This project analyzes 327 patients record from 2020 to uncover trends in dental diagnosis, treatment patterns, denture request, treatment cost. By combining MySQL for data cleaning and exploratory data analysis with Excel dashboard for visualization, this study generates actionable insights to improve patients care.  

PROJECT OBJECTIVE

•	Identifying the most common dental conditions across demographics

•	Explore the link between diagnosis and treatment

•	Provide clinical and administrative recommendations for better patient care

•	Examine how often denture are requested, type of denture and time between date of impression and date of fitting.

•	Access fellow up patterns and patient’s satisfaction

•	Detect sessional trend and recurring patients

•	Compare denture cost from other treatment cost

ABOUT THE DATASET

•	Data source: 2020 patients record from Dental Department General Hospital Gembu.

•	Key Fields: Demographics, Diagnosis, Treatment type, Admission required, treatment cost, denture request, patient’s satisfaction, type of denture, checkup, follow up checkup, date of    impression and date of denture fitting

•	Data size: 327 rows (patients visits)

•	Data limitations

a)	Advance referral cases not included in the dataset.

b)	Some records contained inconsistent spelling, missing values, incorrect, patient’s id and dates that requires cleaning and normalization.

c)	Patients satisfactory were not always consistently recorded.

 TOOLS AND TECHNOLOGIES USED
 
•	MySQL: Data cleaning, normalization and SQL queries

•	Excel: (Pivot tables & Dashboard) Visualization.

KEY INSIGHT BOTH FROM MYSQL AND EXCEL

1) Patient’s demographic

a) Age grading: Middle age adults (122) and young adults (114) make up the bulk visit of patients while elderly and infant make up the least. This shows that the working age population dominates the clinic visits suggesting high awareness and affordability, a low attendance in children and elderly points a gap in pediatric and geriatric dental awareness. 

b) Gender: Out of the 318 patients 189 (58%) were male and 129 (42%) were females, showing a gender gap in dental service utilization indicating that males are more likely to present late-stage conditions, affordability, exposure to oral trauma and tobacco use while low female attendance may reflect financial dependence and cultural role.

c) Diagnosis trends: Cavity(caries), periodontitis and calculus are the most common diagnosis which account for the majority of patients visit, this indicates poor oral hygiene, high sugar intake and limited access to preventive services.

d) Gender: The high occurrence in cavities, periodontitis, stained teeth, jaw fracture, gingivitis, Ludwig’s angina in male may be influenced not only by poor oral hygiene practice, smoking, kola nut chewing, fights/risky jobs but also by the fact that males constitute a greater proportion of the dataset while abscess , cavity and oral lesion are more predominate in females due to poor oral hygiene and many female tend to self-manage their case by placing pain killers pr herbal remedies in the cavity to mask the pain(leading to late hospital presentation) which causes more harm and infection.

e) Age: Each age group has its distinct diagnosis with middle age and young adult having high cavity rate. Malocclusion is more in children and teens while edentulism is more in the elderly

f) 14 cases (4%) were tied to mostly infectious cases like Ludwig angina and abscess this shows that the clinic mainly handle outpatient care 

2) Treatment trends: Extraction (≈30%), scaling (≈29%) and referrals (13%) were the leading treatment, the high rate of extraction is not only due to late presentation as most patients only present only when their condition has become server but also due to financial constraint as most patients cannot afford other alternative like RCT, braces, crown and bridge, veneers  and also of lack necessary materials and instruments which forces the clinic to focus on curative rather than preventive care while scaling ranks second showing that gum related conditions are more common.

3) Denture insight: A significant proportion of patients requested for denture (≥30%), with young adult and middle age patients needing partial denture while the elderly and senior’s full denture due to edentulism. The average time gap between impression date and denture fitting date was 2days with a minimum of 0 days and maximum of 31 days, this indicate that most denture are immediate denture as it reflects that most patients cannot tolerate saddle area for a long period as it affects aesthetics while delay create dissatisfaction.

4) Cost Insight: Middle aged and seniors together contributes over 60-65% of total treatment cost mostly due to denture, while children and adolescent accounted for less than 15% reflecting cheaper extraction and filling for that age group. Male patients make up about 55-60% of high cases (fractures surgical care) and are significantly higher in number while females contributed around 40-45% in denture care. Dentures and fractures driving nearly 50% of expenses with infectious cases like Ludwig angina and abscess also raise cost due to intensive care needs while extraction and scaling dominates visits but add little.

Time trends insight: The time trend reveals that visits spikes in the mid year(Q3) with an increase in denture cost in January and August, while other treatments dominate expenses throughout.  Indicating seasonal patients flow with denture as a recurring but secondary cost driver.

6) Satisfaction insight: Around 70%+ of patients gave positive rating (good, satisfied, very satisfied) showing a positive favorable outcome, while dissatisfaction or pending feedback was mostly tied to delay in denture fitting or unresolved conditions.

RECOMMENDATION

From the analysis several opportunities for improvement were identified. These recommendations below focus on strengthening preventive care, affordability, infrastructure and outreach.

1.	Patients care and clinical quality
	
a)	Promote early and preventive care: implements preventive oral health campaigns(outreach) as most patients only come to the clinic when their conditions is severe.

b)	Cavity, calculus, periodontitis and gingivitis dominates more across all age group, oral health education which focuses more diets and hygiene education should be promoted.

c)	Strengthen follow-up system: Follow up visit were mostly linked to infectious cases (Ludwig angina, abscess) and jaw fracture, most patients rarely return. Create patient recall to encourage checkup and preventive care.

d)	Diversify treatment beyond extraction: Extraction top the treatment type due financial barriers and lack of equipment to perform other form of treatment (RCT, crown and bridge,     veneers, braces) therefore local conservative treatment should be promoted thereby reducing long term tooth loss and denture dependence.

2.	Affordability and access

a)	Most Patient bargain price and care cost are unstable, standardize pricing by introducing tiered service packages.

b)	Advocate for NGO support for high-cost treatment like Ludwig angina, full denture construction and jaw fracture.

c)	Target female patients with family focused financial and support programs

d)	Encourage flexible payment method to reduce delay in starting treatment.

3.	Infrastructure and capacity building

a)	Serve cases were referred out due to lack of equipment, department should advocate for investment in dental equipment (surgical kits, imaging tools etc.) for handling moderate advanced cases locally. 

b)	Inconsistent power supply and financial constraint makes the clinic learn more on cold cure acrylic for denture construction limiting prosthetic quality, hospital should secure reliable power supply (generator, solar) to improve denture production from cold cure to heat cure.

c)	Government should employ more staff to handle advanced cases locally reducing unnecessary referral.

4. Community outreach and policy engagement

a)	Hospital should organize mobile dental clinic for elderly and interior communities.

b)	Expand school based oral health programs for children 

c)	Hospital should collaborate with government, NGO for funding, subsidies and awareness campaigns.

d)	Department should improve on their record keeping for better monitoring, planning and research use.

By adopting these measures, General Hospital Gembu can improve patients satisfaction, optimize resources and expand access to quality oral health care in a resource limited setting.
