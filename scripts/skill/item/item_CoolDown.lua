--剑侠情缘网络版三 千秋万载 一统江湖
--武功技能
--道具技能-CD专用
--技能效果简单说明：给道具技能CD专用
--刘欣 2007-6-12

--------------厚道的分割线-----------------------------------------------------
tSkillData = 
{
    {nCoolDownTime = 35},
    {nCoolDownTime = 2},  --纯阳乌龟饲料
    {nCoolDownTime = 3},
    {nCoolDownTime = 4},
    {nCoolDownTime = 5},
    {nCoolDownTime = 3},
    {nCoolDownTime = 4},
    {nCoolDownTime = 5}
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	
	----------------- 设置Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    
    skill.SetNormalCoolDown(3, tSkillData[dwSkillLevel].nCoolDownTime);
	
    ----------------- 设置杂项参数 ----------------------------------------
   
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com