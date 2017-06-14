---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_西子情_泉凝月.lua
-- 更新时间:	2013/5/29 19:11:22
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_西子情_泉凝月.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-03-2
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  西子情
-- 技能名称  :  泉凝月
-- 技能效果  : 静，冷泉凝月，见泉水十分清静，水面月影如凝固一般。
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 20, 		nDamageRand = 3}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 27, 		nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 34, 		nDamageRand = 4}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 41, 		nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 48, 		nDamageRand = 6}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 55, 		nDamageRand = 7}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 62, 		nDamageRand = 7}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 69, 		nDamageRand = 8}, -- Level 8 
	
};           
             
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	--skill.BindBuff(1, 5735, dwSkillLevel);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/藏剑/藏剑_西子情_泉凝月.lua", -- 属性值1
		0														-- 属性值2
	);  
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 351);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--	skill.nChannelInterval	= 32;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;	
	--skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
	--	skill.nTargetCountLimit	= 1;
	return true;
end


--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能

end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3838)
	end
end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local nlev = player.GetSkillLevel(1666)
	if nlev ~= 0 then
		if player.GetSkillLevel(6541) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6143, 1, 30)
		else
			player.AddBuff(dwCharacterID, player.nLevel, 5735, nlev, 30)
		end

		--泉期间减伤
		if player.GetSkillLevel(14814) == 1 then
			player.AddBuff(player.dwID, player.nLevel, 9904, 1)
		end
	end

	--[[
	--低血量回血
	if player.GetSkillLevel(6535) == 1 then
		if player.nCurrentLife <= player.nMaxLife * 0.3 then
			player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.1
		end
	end
	--]]
	--泉期间闪避20%
	if player.GetSkillLevel(6540) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6142, 1, 1)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com