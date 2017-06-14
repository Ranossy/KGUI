------------------------------------------------
-- 文件名    :  师徒阵法BUFF.lua
-- 创建人    :  CBG
-- 创建时间  :  2009-12-3
-- 用途(模块):  武功技能
-- 武功门派  :  
-- 武功类型  :  
-- 武功套路  :  阵法
-- 技能名称  :  
-- 技能效果  :  剑三真好玩！
----------------------华丽的分割线--------------------------


--------------以下是技能----------------------------------------------------


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;

        skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        1592,		--用于界面的师傅空BUFF
        1			--Level
    );
        
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_MENTOR_BUFF, 
        1582,		--BUFFID
        1		--
    );

        skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        1584,		--施放的hot
        1			--Level
    );
    
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- 属性作用模式
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
   		"skill/阵法/师徒阵法BUFF.lua",				-- 属性值1
   		0														-- 属性值2
   		);
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 30 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 256; 										--施放角度
    skill.nAreaRadius 		= 30 * LENGTH_BASE;							--作用范围
    --阵眼
	skill.bIsFormationSkill		= true
	skill.nLeastFormationPopulation= 2	
    skill.nFormationRange		= 30 * LENGTH_BASE;	-- 结阵的范围
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

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	if player then
		if player.nLevel >= 70 then
			player.AddBuff(player.dwID,player.nLevel,1732,1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com