---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_虎牙令_疾如风.lua
-- 更新时间:	2013/5/11 21:12:10
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_虎牙令_疾如风.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-03-4
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  虎牙令
-- 技能名称  :  疾如风
-- 技能效果  :  攻击速度和伤害增加,躲闪和防御降低
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 23, nBuffID = 200, nBuffLevel = 1}, -- Level 1
	{nCostMana = 28, nBuffID = 200, nBuffLevel = 2}, -- Level 2
	{nCostMana = 34, nBuffID = 200, nBuffLevel = 3}, -- Level 3
	{nCostMana = 39, nBuffID = 200, nBuffLevel = 4}, -- Level 4
	{nCostMana = 45, nBuffID = 200, nBuffLevel = 5}, -- Level 5

};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel = 5;
	
    
	--skill.BindBuff(1, 2761, tSkillData[dwSkillLevel].nBuffLevel)
--施放 50级傲血支持下的 疾如风力拔
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_SRC,
		705,
		1
	);
	----天策攻击阵法第五重
	skill.AddAttribute(					
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		768,
		1
	);

	skill.AddAttribute(					
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, --解除击倒
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		7276,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/天策_虎牙令_疾如风.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 107);	   
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostManaBasePercent = 106;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
    
    
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
	--免控
	player.AddBuff(player.dwID, player.nLevel, 855, 2, 1)
	if player.GetSkillLevel(5670) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 855, 3, 1)
	end

	--有奇穴就添加御劲，没有奇穴正常提高会心
	if player.GetSkillLevel(14805) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9864, 1)	--降低被会心几率
	else
		player.AddBuff(player.dwID, player.nLevel, 2761, 5)	--正常的
	end
	
	if player.GetSkillLevel(5672) == 1 then
		player.CastSkill(6066, 1)
	end
	
	ModityCDToUI(player, 412, 0, 0)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com