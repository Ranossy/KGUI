---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_羽林枪法_龙牙.lua
-- 更新时间:	2013/12/4 14:53:24
-- 更新用户:	taoliJX3
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_羽林枪法_龙牙.lua
-- 创建人    :  张奇
-- 修改人    ： 刘恒志	
-- 创建时间  :  2008-03-04
-- 修改时间  ： 2008-06-04 
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  羽林枪法
-- 技能名称  :  龙牙
-- 技能效果  :  对目标造成大量伤害,吞噬重伤,附带破甲效果
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamage = 70, nDamageRand = 5, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamage = 75, nDamageRand = 5, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamage = 80, nDamageRand = 5, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamage = 85, nDamageRand = 5, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamage = 90, nDamageRand = 5, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamage = 92, nDamageRand = 5, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamage = 94, nDamageRand = 5, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamage = 96, nDamageRand = 5, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamage = 98, nDamageRand = 5, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamage = 100, nDamageRand = 5, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamage = 211 * 0.5, nDamageRand = 5, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamage = 224 * 0.5, nDamageRand = 10, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamage = 237 * 0.5, nDamageRand = 10, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamage = 250 * 0.5, nDamageRand = 10, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamage = 263 * 0.5, nDamageRand = 10, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamage = 276 * 0.5, nDamageRand = 10, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamage = 289 * 0.5, nDamageRand = 10, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamage = 302 * 0.5, nDamageRand = 10, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamage = 315 * 0.5, nDamageRand = 10, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamage = 328 * 0.5, nDamageRand = 15, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamage = 341 * 0.5, nDamageRand = 15, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamage = 354 * 0.5, nDamageRand = 15, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamage = 367 * 0.5, nDamageRand = 15, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamage = 380 * 0.5, nDamageRand = 15, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamage = 393 * 0.5, nDamageRand = 15, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamage = 406 * 0.5, nDamageRand = 15, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamage = 419 * 0.5, nDamageRand = 15, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamage = 432 * 0.5, nDamageRand = 15, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamage = 445 * 0.5, nDamageRand = 15, }, -- Level 29
}; 

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CONSUME_BUFF, -- 吞噬Buff
		540, -- 属性值1
		0																-- 属性值2
	);
	--skill.AddAttribute(														--2010.05.08添加橙武技能
		--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		--ATTRIBUTE_TYPE.CALL_BUFF,
		--2984,
		--1
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/天策_技能事件_灭命中后刷新破风.lua", -- 属性值1
		0														-- 属性值2
	);
	---龙牙附带AOE效果
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/天策_羽林枪法_龙牙.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 540, 2);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot 
	----------------- 设置CoolDown ---------------------------------------------------------------------
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 97);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 280*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 280 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 280 * 0.5;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 280 * 0.8;
	else
		skill.nCostManaBasePercent = 280;
	end
	----------------- 设置技能施放buff需求 ----------------------------------------------------------------------
	skill.AddSlowCheckDestOwnBuff(540, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent = 1024;
	
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 100 * 1.1 * 1.1;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = (100 + (dwSkillLevel - 9) * 5) * 1.1 *1.1
	else
		skill.nChannelInterval = 197 * 1.1 *1.1;     -- 通道技间隔时间 
	end
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
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
	--满级新手指引任务
	--local nQuestIndex = player.GetQuestIndex(13419)
	--local nQuestPhase = player.GetQuestPhase(13419)
	--if nQuestIndex and nQuestPhase == 1 then
		--player.SetQuestValue(nQuestIndex, 0, skill.dwLevel)
	--end
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
	local lv = player.GetSkillLevel(415)

	--命中有自身流血效果目标额外10%伤害
	if player.GetSkillLevel(15001) == 1 then
		local nlev_pofeng = player.GetSkillLevel(401)
		if nlev_pofeng ~= 0 and target.GetBuffByOwner(3442, nlev_pofeng, player.dwID) then
			player.CastSkill(15002,lv)
		end
	end

	if player.GetSkillLevel(5658) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5637, 1, 1)
		player.CastSkillXYZ(6063, lv, target.nX, target.nY, target.nZ)
		player.CastSkillXYZ(6069, lv, target.nX, target.nY, target.nZ)
		player.PlaySfx(472, target.nX, target.nY, target.nZ)
	end
	if player.GetSkillLevel(5688) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5643, 1, 1)
	end

	--铁牢大漠奇穴龙牙叠降低防御buff
	if player.GetSkillLevel(6869) == 1 and player.GetBuff(7657, 1) then
		target.AddBuff(dwSkillSrcID, player.nLevel, 7658, 1, 1)
	end

	--35%几率不消耗致残效果
	if player.GetSkillLevel(6517) == 1 and not player.GetBuff(9973, 1) then
		local nRnd = Random(1, 10000)
		if nRnd <= 3000 then
			target.AddBuff(player.dwID, player.nLevel, 540, 1)
			player.AddBuff(player.dwID, player.nLevel, 9973, 1)
		end
	end

	--傲雪牧云奇穴龙牙叠会心
	if player.GetSkillLevel(6511) == 1 then
		local newbuff = player.GetBuff(7671, 1)
		if newbuff then
			local nbuffcount = newbuff.nStackNum
			local nbuffleftframe = newbuff.nLeftActiveCount
			if nbuffcount < 4 then
				player.AddBuff(player.dwID,player.nLevel,7671,1,nbuffleftframe)
			end
		end
		--[[
		if player.GetBuff(7671, 3) then
			local newbuff = player.GetBuff(7671, 3)
			local nbuffcount = newbuff.nLeftActiveCount
			if nbuffcount ~= 0 then
				player.AddBuff(player.dwID, player.nLevel, 7671, 4, nbuffcount)
				player.DelBuff(7671, 3)
			end
		end
		if player.GetBuff(7671, 2) then
			local newbuff = player.GetBuff(7671, 2)
			local nbuffcount = newbuff.nLeftActiveCount
			if nbuffcount ~= 0 then
				player.AddBuff(player.dwID, player.nLevel, 7671, 3, nbuffcount)
				player.DelBuff(7671, 2)
			end
		end
		if player.GetBuff(7671, 1) then
			local newbuff = player.GetBuff(7671, 1)
			local nbuffcount = newbuff.nLeftActiveCount
			if nbuffcount ~= 0 then
				player.AddBuff(player.dwID, player.nLevel, 7671, 2, nbuffcount)
				player.DelBuff(7671, 1)
			end
		end
		--]]
	end
	
	local i = Random(1, 100)
	if i <= 15 then
		if player.GetSkillLevel(5665) == 1 then
			player.CastSkill(406, 1)
		end
	end

	if player.GetBuff(1911, 2) then
		target.AddBuff(dwSkillSrcID, player.nLevel, 540, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com