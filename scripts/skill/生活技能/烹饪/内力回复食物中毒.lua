--生活技能烹饪、医术一个BUFF一个DEBUFF类技能
--陈翰林
--08.03.19
--修改数值
--韩正春
--09.06.05

--------------我不是分割线----------------------------------------------------

tSkillData =
{
		{nAddDebufflevel = 1 },
		{nAddDebufflevel = 1 },
		{nAddDebufflevel = 4 },
		{nAddDebufflevel = 7 },
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能相关数值
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
	
	--设置Buff---------	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        225,
        dwSkillLevel
    );
    
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        525,
        tSkillData[dwSkillLevel].nAddDebufflevel
    );

 if skill.dwLevel == 1 then	
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- 属性作用模式
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
   		"skill/生活技能/烹饪/内力回复食物中毒.lua",				-- 属性值1
   		0														-- 属性值2
   		);
 end
   		
	--设置cool down------

	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab----------------

	 skill.SetNormalCoolDown(1,132);
     skill.SetNormalCoolDown(2,129);
	
	--设置其他参数-------
  
    --内力消耗
   	-- skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --攻击半径，也就是攻击的有效距离
   	-- skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
   	-- skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
    --吟唱帧数
    skill.nPrepareFrames    = PRE_FRAMES;
    --子弹速度
	-- skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
    --被打断的概率
	--  skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
    return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--npc: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(npc, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AcquireAchievement(307)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com