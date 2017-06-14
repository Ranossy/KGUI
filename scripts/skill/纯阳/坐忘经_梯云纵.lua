---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/坐忘经_梯云纵.lua
-- 更新时间:	2013/4/18 11:06:41
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  扶摇直上.lua
-- 创建人    :  刘欣
-- 创建时间  :  2007-9-25
-- 用途(模块):  武功技能
-- 武功门派  :  江湖
-- 武功类型  :  外功
-- 武功套路  :  防身武艺
-- 技能名称  :  扶摇直上
-- 技能效果  :  重力加速度减小，同时增加起跳速度
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nBuffLevel = 1, nCostMana = 26 }, 
	{nBuffLevel = 2, nCostMana = 47 }, 
	{nBuffLevel = 3, nCostMana = 65 }, 
	{nBuffLevel = 4, nCostMana = 83 }, 
	{nBuffLevel = 5, nCostMana = 101},
	{nBuffLevel = 6, nCostMana = 26 }, 
	{nBuffLevel = 7, nCostMana = 47 }, 
	{nBuffLevel = 8, nCostMana = 65 }, 
	{nBuffLevel = 9, nCostMana = 83 }, 
	{nBuffLevel = 10, nCostMana = 101}
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		932,
		1
	);	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1889,
		dwSkillLevel
	);	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1888,
		dwSkillLevel
	);
	skill.AddSlowCheckSelfBuff(208, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	    --不能有梯云纵
	skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff--吞日月，禁轻功

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1298,
		1
	); 				--清掉浩气盟草上飞的Buff
			
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1299,
		1
	); 				--清掉恶人谷草上飞的Buff
						
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1691,
		1
	); 				--清掉回龙岭瞬的Buff，20100522 失败的man修改
	
	----------------- 设置Cool down ---------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(2, 1189);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置杂项参数 ---------------------------------------- 
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana 
	skill.nCostManaBasePercent = 68;	-- 技能消耗的内力
	--攻击半径，也就是攻击的有效距离
	--skill.nMaxRadius        = 4 * LENGTH_BASE;
	--skill.nAngleRange       = 64; 
	--吟唱帧数
	skill.nPrepareFrames = 0;
	--子弹速度
	skill.nBulletVelocity = 0;
	--被打断的概率
	skill.nBreakRate = 0;
   
	return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(67)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com