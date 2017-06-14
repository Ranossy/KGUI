--剑侠情缘网络版三 千秋万载 一统江湖
--武功技能
--NPC技能-BOSS技能


--------------厚道的分割线-----------------------------------------------------
tSkillData = 
{
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 1, nTherapy=15000},		--level 1
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 2, nTherapy=15000},		--level 2
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 3, nTherapy=15000},		--level 3
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 4, nTherapy=15000},		--level 4
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 5, nTherapy=15000},		--level 5
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 6, nTherapy=15000},		--level 6
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 7, nTherapy=15000},		--level 7
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 8, nTherapy=15000},		--level 8
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 9, nTherapy=15000},		--level 9
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 10, nTherapy=15000},		--level 10
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 11, nTherapy=15000},		--level 11
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 12, nTherapy=15000},		--level 12
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 13, nTherapy=15000},		--level 13
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 14, nTherapy=15000},		--level 14
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 15, nTherapy=15000},		--level 15
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 16, nTherapy=15000},		--level 16
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 17, nTherapy=15000},		--level 17
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 18, nTherapy=15000},		--level 18
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 19, nTherapy=15000},		--level 19
	{nDamageBase = 0, nDamageRand = 0, nLifeAdd = 4000, nBuffID=0, nBuffLevel= 20, nTherapy=15000},		--level 20
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
    
    local dwSkillLevel = skill.dwLevel;
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_THERAPY, 
        tSkillData[dwSkillLevel].nLifeAdd,
        0
    );	
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_THERAPY, 
        0,
        0
    );
    
    ----------------- 设置Hot ---------------------------------------------
    

	
    ----------------- 设置Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    
    --   skill.SetNormalCoolDown(1, 7);
    
    ----------------- 设置杂项参数 ----------------------------------------
   
    --升级经验
    --skill.dwLevelUpExp      = tSkillData[dwSkillLevel].nLevelUpExp;    
    --内力消耗
    --skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --攻击半径，也就是攻击的有效距离
    skill.nMaxRadius        = 20 * LENGTH_BASE;
    skill.nAngleRange       = 256; 
    --吟唱帧数
    skill.nPrepareFrames    = 0;
    --子弹速度
    skill.nBulletVelocity   = 0;
    --被打断的概率
    skill.nBreakRate        = 0;
   
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