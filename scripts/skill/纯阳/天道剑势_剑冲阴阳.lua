------------------------------------------------
-- 文件名    :  天道剑势_剑冲阴阳.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  天道剑势
-- 技能名称  :  剑冲阴阳
-- 技能效果  :  普通攻击30%附减治疗效果50%；效果持续6秒；
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nBuffID = 131, nBuffLevel = 1, nCostMana = 248},	--level 1
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
	
	skill.BindBuff(1, 131, tSkillData[dwSkillLevel].nBuffLevel)
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    skill.SetPublicCoolDown(16);	--公共CD
    --skill.SetNormalCoolDown(2, 82);	--CD6s
    
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = MELEE_ATTACK_DISTANCE;						--技能施放最大半径
    skill.nAngleRange       = 128; 									--施放角度
    
    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    --skill.nBreakRate        = 1024;									--打断的概率,默认1024表示一定打断
       
    return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--以下是魔法属性执行脚本时,要 调用的函数; dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	--local player = GetPlayer(dwCharacterID)
	
	
	--player.SetRepresentID(EQUIPMENT_REPRESENT.WEAPON_METEOR, 1)
	--player.SetTimer(20, "scripts/skill/纯阳/天道剑势_剑冲阴阳.lua", 0, 0)
end

function UnApply(dwCharacterID)
	--local player = GetPlayer(dwCharacterID)
	
	--print("SetRepresentID back")
	--player.SetRepresentID(EQUIPMENT_REPRESENT.WEAPON_METEOR, 0)
	--player.SetRepresentID(EQUIPMENT_REPRESENT.WEAPON_ENCHANT2, 0)
end

function OnTimer(player, nParam1, nParam2)
	--print("SetRepresentID")
	--player.SetRepresentID(EQUIPMENT_REPRESENT.WEAPON_ENCHANT2, 1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com