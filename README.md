# Analyze Data with Python

```
  df.groupby('website_goal')\
  	.first_name.count()\
  	.reset_index()\
  	.rename(columns={'first_name': 'number_of_citizens'})
```

```
survey_results = df.groupby('website_goal')\
  	.first_name.count()
  
# Make a pie chart
plt.pie(survey_results.values,
        labels=survey_results.index,
        autopct='%d%%'
       )
plt.title('Why do citizens visit our website?')
plt.axis('equal')
```

```
	first_name	last_name	gender	age	visit_date	website_goal
0	James	Mcguire	male	50.0	2017-10-26	Find a job
1	John	Vaughan	male	35.0	2017-11-09	Pay a bill
2	Robert	Dillon	male	33.0	2017-11-28	Pay a bill
3	Michael	Cameron	male	40.0	2017-09-27	When is trash day?
4	William	Yang	male	38.0	2017-11-01	Contact City Council
```
### Find Integer place 

modulo function (%) with 10 to find the ones’ place of an integer.

```
>>> 41%10
1
>>> 2%10
2 
>>> 39%10
9
>>> 103%10
3
>>> 20%10
0
```

### List 

```
list(zip(list(var)))
list(range(int)

```

```
list.count('element')
list.sort()
sorted(list)
```

### List Comprehension

```
[2*index + 0.8 for index in range(5)]
[(x1 + x2)/2.0 for (x1, x2) in zip(x_values_1, x_values_2)]

xy = [[1, 3], [2, 4], [3, 3], [4, 2]]
z = [x * y for (x, y) in xy]
```

### Lambda 

lambda function is a one-line shorthand for function

```
add_two = lambda my_input: my_input + 2
print(add_two(3))

check_if_A_grade = lambda grade: 'Got an A!' if grade >= 90 else 'Did not get an A...'

add_random = lambda num : num + random.randint(1,10)
```

--- 

# Numpy 

> Unlike a mean, the median is not affected by outliers

axis = 0 , column-wise
axis = 1 , row-wise

* np.sqrt(var)
* np.sort(var)
* np.median(var)
* np.mean(var)

### array from csv 

np.genfromtxt('.csv',delimiter=',')

### percentile 

Nth percentile is defined as the point N% of samples lie below it

```
d = np.array([1, 2, 3, 4, 4, 4, 6, 6, 7,  8, 8])
np.percentile(d, 40)
```

The 25th percentile is called the first quartile
The 50th percentile is called the median
The 75th percentile is called the third quartile

> to find the interquartile range, we subtract the value of the 25th percentile from the value of the 75th

> The smaller the interquartile range value, the less variance in our dataset. The greater the value, the larger the variance.

### Standard Deviation

Similar to the interquartile range, the standard deviation tells us the spread of the data. 
The larger the standard deviation, the more spread out our data is from the center. 
The smaller the standard deviation, the more the data is clustered around the mean


```
np.std(var)
```

### Histogram

* bins 
* frequency 

### Types of Distributions

* unimodal dataset has only one distinct peak.
* bimodal dataset has two distinct peaks.
* multimodal dataset has more than two peaks.
* uniform dataset doesn’t have any distinct peaks.

* symmetric dataset has equal amounts of data on both sides of the peak.
* skew-right dataset has a long tail on the right of the peak, but most of the data is on the left.
* skew-left dataset has a long tail on the left of the peak, but most of the data is on the right.

>  type of distribution affects the position of the mean and median. In heavily skewed distributions, the mean becomes a less useful measurement.

### Normal Distribution

* normal distribution, which is a symmetric, unimodal distribution.

* The mean sets the “middle” of the distribution, and the standard deviation sets the “width” of the distribution. A larger standard deviation leads to a wider distribution. A smaller standard deviation leads to a skinnier distribution


* np.random.normal(loc,scale,size)
generating random numbers, including one specifically built to generate a set of numbers that fit a normal distribution

loc: the mean for the normal distribution
scale: the standard deviation of the distribution
size: the number of random numbers to generate

```
b_data = np.random.normal(6.7,0.7,1000)

# Fictionosaurus
f_data = np.random.normal(7.7,0.3,1000)

mystery_dino = 'Brachiosaurus'
answer = False

plt.hist(b_data,
         bins=30, range=(5, 8.5), histtype='step',
         label='Brachiosaurus')
plt.hist(f_data,
         bins=30, range=(5, 8.5), histtype='step',
         label='Fictionosaurus')
plt.xlabel('Femur Length (ft)')
plt.legend(loc=2)
plt.show()

```

### Standard Deviations and Normal Distribution

standard deviation affects the “shape” of our normal distribution

Suppose that we have a normal distribution with a mean of 50 and a standard deviation of 10. When we say “within one standard deviation of the mean”, 

```
lower_bound = mean - std
            = 50 - 10
            = 40
 
upper_bound = mean + std
            = 50 + 10
            = 60
```


```
68% of our samples will fall between +/- 1 standard deviation of the mean
95% of our samples will fall between +/- 2 standard deviations of the mean
99.7% of our samples will fall between +/- 3 standard deviations of the mean
```
> 2000 students took the exam. How many would you expect to have scores within the range of one_above and one_below?



```
one_above = 1000 + 100
one_below = 1000 -100

print(one_above, one_below)

one_std = np.random.normal(1000,100,2000)

expected_std= one_std[(one_std > one_below) & (one_std< one_above)]

or 

one_std  = 2000 * 68 / 100
```

