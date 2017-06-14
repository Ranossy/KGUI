------------------------------------------------
-- 文件名    :  天策防御阵法BUFF.lua
-- 创建人    :  吴娟
-- 创建时间  :  2008-2-23
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  
-- 武功套路  :  阵法
-- 技能名称  :  
-- 技能效果  :  阵法效果
----------------------华丽的分割线--------------------------


--------------以下是技能----------------------------------------------------


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_BUFF, 
		923,		--BUFFID
		6		--
	);
    skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,					
		"skill/阵法/天策防御阵法BUFF.lua",
		0
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

function Apply(dwCharacterID)
--	local player = GetPlayer(dwCharacterID)
--	print(player.szName)
--	local targetplayer = nil
--	local eType,nTargetID = player.GetSkillTarget()
--	if eType == TARGET.PLAYER then
--		targetplayer = GetPlayer(nTargetID)
--	end
--	print(targetplayer.szName)
--	local buff_yiqixiangtou = nil
--	buff_yiqixiangtou = targetplayer.GetBuff(1757,0)
--	print(buff_yiqixiangtou)
--	if buff_yiqixiangtou then
--		print(buff_yiqixiangtou.nLevel)
--		player.AddBuff(0,99,923,buff_yiqixiangtou.nLevel,0)
--		targetplayer.AddBuff(0,99,923,buff_yiqixiangtou.nLevel,0)
--	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com