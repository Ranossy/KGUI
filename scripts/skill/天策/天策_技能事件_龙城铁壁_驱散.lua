---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_技能事件_龙城铁壁_驱散.lua
-- 更新时间:	2013/9/11 17:02:38
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_技能事件_御_驱散御.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-6-19
-- 用途(模块):  武功技能
-- 武功门派  :  天策	
-- 武功类型  :  外功
-- 武功套路  :  是
-- 技能名称  :  技能事件
-- 技能效果  :  被击打后,驱散御效果,
------------------------------------------------

tSkillData = 
{

};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能相关数值
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		2778,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/天策_技能事件_龙城铁壁_驱散.lua", -- 属性值1
		0														-- 属性值2
	);

--设置cool down------

--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab----------------

	-- skill.SetNormalCoolDown(1,7);
	
--设置其他参数-------
  
	--内力消耗
--    skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
	--攻击半径，也就是攻击的有效距离
	skill.nMaxRadius = 20 * LENGTH_BASE;
	skill.nAngleRange = 256; 
	skill.nAreaRadius = 20 * LENGTH_BASE;
	--吟唱帧数
	--  skill.nPrepareFrames    = tSkillData[dwSkillLevel].nPrepareFrames;
	--子弹速度
	--  skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
	--被打断的概率
	-- skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
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
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nbuff = player.GetBuff(6810, 1)
	if nbuff then
		local targetID = nbuff.dwSkillSrcID
		local target = GetPlayer(targetID)
		if not target then
			return
		end
		target.CastSkill(14798, 1)
		ModityCDToUI(target, 2628, 0, 0)
	end
	
	if not player.GetBuff(2778, 1) then
		player.DelBuff(6810,1)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com