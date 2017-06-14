---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/西河剑器_月华倾泻.lua
-- 更新时间:	2013/5/7 14:55:44
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  七秀_西河剑器_月华倾泻.lua
-- 创建人    :  刘欣	
-- 创建时间  :  2008-8-31
-- 用途(模块):  武功技能
-- 武功门派  :  七秀
-- 武功类型  :  内功
-- 武功套路  :  是
-- 技能名称  :  月华倾泻
-- 技能效果  :  转移内力
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nSelfManaDecrease = -127, nOtherManaAdd = 127, nFrame = 32},
	{nSelfManaDecrease = -205, nOtherManaAdd = 205, nFrame = 48},
	{nSelfManaDecrease = -269, nOtherManaAdd = 269, nFrame = 64},
	{nSelfManaDecrease = -333, nOtherManaAdd = 333, nFrame = 80},
	{nSelfManaDecrease = -397, nOtherManaAdd = 397, nFrame = 16},
}


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = 4
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/七秀/西河剑器_月华倾泻.lua", --属性值1
		0															--属性值2
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);				--公共CD，1.5秒
	skill.SetNormalCoolDown(1, 118);				--自身CD，120秒
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nOtherManaAdd * 4;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
 	
	skill.nBreakRate = 1024;									--被打断的概率,默认1024表示一定被打断
	skill.nChannelFrame = tSkillData[dwSkillLevel].nFrame;
	--skill.nChannelFrame		=  128
	skill.nChannelInterval = 16;
	skill.nMinChannelInterval = 1;-- 通道技间隔时间 
	return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	if player.nCurrentMana < player.nMaxMana * 0.15 then
		return SKILL_RESULT_CODE.NOT_ENOUGH_MANA
	else
		return nPreResult;
	end
end
function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end


function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	local targetType, targetID = player.GetTarget()
	local target = GetPlayer(targetID)
	if not target then
		return
	end
	if IsEnemy(player.dwID, target.dwID) ~= true then
		if player.nCurrentMana >= player.nMaxMana * 0.15 then
			local currentMana = player.nMaxMana * 0.1
			player.nCurrentMana = player.nCurrentMana - currentMana
			target.nCurrentMana = target.nCurrentMana + currentMana
		else
			player.Stop()
		end
	end	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com