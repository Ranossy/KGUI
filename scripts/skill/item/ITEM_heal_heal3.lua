--剑侠情缘网络版三 千秋万载 一统江湖
--武功技能
--道具技能-稻香饼
--技能效果简单说明：道具治疗,Hot效果
--刘欣 2006-9-6

--------------厚道的分割线-----------------------------------------------------
tSkillData = 
{
    {nHotLevel = 1},
    {nHotLevel = 2},
    {nHotLevel = 3},
    {nHotLevel = 4},
    {nHotLevel = 5},
    {nHotLevel = 6},
    {nHotLevel = 7},
    {nHotLevel = 8},
    {nHotLevel = 9},
    {nHotLevel = 10},
    {nHotLevel = 11},
    {nHotLevel = 12},
    {nHotLevel = 13},
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

		local dwSkillLevel = skill.dwLevel;
		skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        588,
        tSkillData[dwSkillLevel].nHotLevel 
    );
	
	    skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SIT,
		0,
		0
	);
	
	----------------- 设置Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    
    skill.SetNormalCoolDown(1, 10);
	
    ----------------- 设置杂项参数 ----------------------------------------

    --攻击半径，也就是攻击的有效距离
    --skill.nMaxRadius        = 10 * LENGTH_BASE;
    skill.nAngleRange       = 360; 
    --吟唱帧数
    skill.nPrepareFrames    = 0;
    --子弹速度
    skill.nBulletVelocity   = 0;
    --被打断的概率
    skill.nBreakRate        = 1000;
   
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