------------------------------------------------
-- 文件名    :  空雾峰_小怪技能_狂暴.lua
-- 创建人    :  陈步高
-- 创建时间  :  2009-3-10
-- 用途(模块):  副本
-- 武功门派  :  空雾峰小怪技能
-- 武功类型  :  
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  外功伤害增加20%
----------------------华丽的分割线--------------------------


--------------以下是技能----------------------------------------------------


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 1 },		--level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 2 },		--level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 3 },		--level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 4 },		--level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 5 },		--level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 6 },		--level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 7 },		--level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 8 },		--level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 9 },		--level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 10},		--level 10
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 11},		--level 11
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 12},		--level 12
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 13},		--level 13
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 14},		--level 14
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 15},		--level 15
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 16 },		--level 16
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 17 },		--level 17
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 18 },		--level 18
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 19 },		--level 19
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 20},		--level 20	
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;

           skill.BindBuff(1,977,1);		-- 设置1号位Buff 

    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;

    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 5 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 256; 										--施放角度
    --skill.nAreaRadius 		= 15 * LENGTH_BASE;							--作用范围
    --skill.nTargetCountLimit	= 10;			                                                      -- 技能作用目标数量限制
    --skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity   = 12;										--子弹速度,点/帧
    
    --skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
   
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

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com