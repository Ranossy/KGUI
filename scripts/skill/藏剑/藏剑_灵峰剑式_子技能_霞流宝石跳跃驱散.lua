------------------------------------------------
-- 文件名    :  藏剑_灵峰剑式_子技能_霞流宝石远距离.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-01-28
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 15 ,nDamage = 28 *0.95, nDamageRand = 28 *0.1},   	-- Level 1 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 52 *0.95, nDamageRand = 52 *0.1},   	-- Level 2 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 73 *0.95, nDamageRand = 73 *0.1},   	-- Level 3 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 94 *0.95, nDamageRand = 94 *0.1},   	-- Level 4 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 115*0.95, nDamageRand = 115*0.1},   	-- Level 5 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 136*0.95, nDamageRand = 136*0.1},   	-- Level 6 
	{nAddRage = 0, nCostRage = 15 ,nDamage = 157*0.95, nDamageRand = 157*0.1},   	-- Level 7 
	{nAddRage = 0, nCostRage = 20 ,nDamage = 185*0.95, nDamageRand = 185*0.1}   	-- Level 8
};           
             

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	for i = 1, 2 do
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
			ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF,
			7, 
			10000
		);
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,		-- 属性作用模式
			ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF,			-- 魔法属性
			3,												--属性值1
			10000											--属性值2
		);
		   	
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,		-- 属性作用模式
			ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF,			-- 魔法属性
			5,												--属性值1
			10000												--属性值2
		);
	
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,		-- 属性作用模式
			ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF,			-- 魔法属性
			11,												--属性值1
			10000												--属性值2
		);
	end
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
   	skill.nChannelInterval	= 32;
	skill.nAreaRadius		= 6 * LENGTH_BASE;		-- 技能作用半径 
	skill.nMinRadius	= 0* LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius        = 6 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 256; 										--施放角度,全角256
    skill.nWeaponDamagePercent	= 1024;
	skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
	skill.nTargetCountLimit	= 10;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
   
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

--function Apply(dwCharacterID)
--	local player = GetPlayer(dwCharacterID)
--	
--
--	player.DelMultiGroupBuffByFunctionType(4);
--	player.DelMultiGroupBuffByFunctionType(6);
--	player.DelMultiGroupBuffByFunctionType(8);
--	player.DelMultiGroupBuffByFunctionType(7);
--	
--end
--
--function UnApply(dwCharacterID)
--end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com