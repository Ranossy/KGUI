---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_羽林枪法_沧月.lua
-- 更新时间:	2013/5/9 15:04:37
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_羽林枪法_沧月.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-02-26 16:14	
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  羽林枪法
-- 技能名称  :  沧月
-- 技能效果  :  当前目标击倒,并击退周围目标20米

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--附加仇恨暂定和技能伤害相等
tSkillData = 
{
	{nCostMana = 98, nKnockedBackSpeed = 100, nKnockedBackDis = 20 * LENGTH_BASE, nBuffID = 724, nBuffLevel = 1, nDamage = 98 * 0.95, nDamageRand = 98 * 0.1}, -- Level 1
	{nCostMana = 126, nKnockedBackSpeed = 100, nKnockedBackDis = 20 * LENGTH_BASE, nBuffID = 724, nBuffLevel = 1, nDamage = 126 * 0.95, nDamageRand = 126 * 0.1}, -- Level 1
	{nCostMana = 153, nKnockedBackSpeed = 100, nKnockedBackDis = 20 * LENGTH_BASE, nBuffID = 724, nBuffLevel = 1, nDamage = 153 * 0.95, nDamageRand = 153 * 0.1}, -- Level 1
	{nCostMana = 181, nKnockedBackSpeed = 100, nKnockedBackDis = 20 * LENGTH_BASE, nBuffID = 724, nBuffLevel = 1, nDamage = 181 * 0.95, nDamageRand = 181 * 0.1}, -- Level 1
	
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = 4;
	skill.BindBuff(2, 994, 2);
	skill.BindBuff(1, 724, 1);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_KNOCKED_DOWN,
		16,
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/天策_羽林枪法_沧月.lua", -- 属性值1
		0														-- 属性值2
	);
	--施放 子技能_群体击退
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	--和天策_游龙骑法_裂苍穹 共CD
	skill.SetNormalCoolDown(1, 197);
	skill.SetCheckCoolDown(1, 444)
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 288;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nWeaponDamagePercent = 0;
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
	
	skill.nDismountingRate = 1024;									--落马率为100%
	    
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
   
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
end
function Apply(dwCharacterID, dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	player.AddBuff(dwCharacterID, player.nLevel, 5864, 1, 1)
	local lv = player.GetSkillLevel(480)
	if lv == 0 then
		return
	end
	--击倒当前目标
	player.CastSkill(13467, lv)
	
	if player.GetSkillLevel(5668) == 1 then
		player.CastSkill(6064, lv)
	else
		player.CastSkill(481, lv)
		if player.GetSkillLevel(5667) == 1 then
			--if not target.GetBuff(5638, 1) then
			--target.AddBuff(player.dwID, player.nLevel, 5638, 1, 1)
			--target.AddBuff(player.dwID, player.nLevel, 5639, 1, 1)
			player.AddBuff(dwCharacterID, player.nLevel, 5864, 1, 1)
			--end
		end
		if player.GetSkillLevel(5691) == 1 then
			if not IsPlayer(dwCharacterID) then
				target.ModifyThreat(dwCharacterID, 1200 * lv)
			end
		end
		if player.GetSkillLevel(5692) == 1 then
			player.CastSkill(6070, lv)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com