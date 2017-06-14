---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_游龙骑法_御奔突.lua
-- 更新时间:	2013/4/17 17:06:46
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_游龙骑法_御奔突.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-03-06
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  游龙骑法
-- 技能名称  :  御奔突
-- 技能效果  :  快马加鞭
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 23, nBuffID = 204, nBuffLevel = 1}, -- Level 1
	{nCostMana = 28, nBuffID = 204, nBuffLevel = 2}, -- Level 2
	{nCostMana = 34, nBuffID = 204, nBuffLevel = 3}, -- Level 3
	{nCostMana = 39, nBuffID = 204, nBuffLevel = 4}, -- Level 4
	{nCostMana = 45, nBuffID = 204, nBuffLevel = 5}, -- Level 5

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/天策_游龙骑法_御奔突.lua", -- 属性值1
		0														-- 属性值2
		);
	
	--[[
	skill.AddAttribute(
		 ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		 ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		 1104, 
		 dwSkillLevel
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
		108,											
		0											
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
		103,											
		0											
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
		105,											
		0											
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
		189,											
		0											
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
		436,											
		0											
	);
	--print(1111)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,					
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,								
		104,											
		0											
	);								
	skill.BindBuff(1, 204, tSkillData[dwSkillLevel].nBuffLevel);	-- 加速Buff

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 102); 
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 243;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
    
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 1024;									--被打断的概率,默认1024表示一定被打断
   
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
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(5677) == 1 then
		player.CastSkill(6067, 1)
	end
	
	ModityCDToUI(player, 425, 0, 0)
	player.SetTimer(1, "scripts/skill/天策/天策_游龙骑法_御奔突.lua", 0, 0)
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
	ModityCDToUI(player, 433, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com