------------------------------------------------
-- 文件名    :  洛道_暴雨梨花针.lua
-- 创建人    :  吴娟	
-- 创建时间  :  2008-07-7 11:22	
-- 用途(模块):  洛道竞技场BOSS技能
-- 武功门派  :  BOSS技能
-- 武功类型  :  外功
-- 武功套路  :  
-- 技能名称  :  暴雨梨花针
-- 技能效果  :  群体AOE，瞬发，给其周围10米内的仇恨仇恨列表里的玩家和NPC添加一个毒性DEBUFF，该DEBUFF为一个中毒持续12秒，DEBUFF移除的时候造成1000点毒性伤害。（要求玩家在12秒内为队友驱散）


--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--附加仇恨暂定和技能伤害相等
tSkillData =
{
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	
	skill.BindBuff(1, 664,1);
	
	--[[
	--施放 子技能 在铁牢律状态下,带有破甲效果,附带大量仇恨
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		664,										
		1
	);
	--]]
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nWeaponDamagePercent		= 0;
	skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius        = 10 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 256; 										--施放角度,全角256
    skill.nAreaRadius      	= 10 * LENGTH_BASE; 										--施放角度,全角256
	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	--skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
   
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