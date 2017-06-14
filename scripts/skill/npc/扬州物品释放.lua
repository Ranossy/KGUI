------------------------------------------------
-- 文件名    :  物品技能释放.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-8-22
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  外功
-- 武功套路  :  测试武功
-- 技能名称  :  物品技能测试
-- 技能效果  :  物品技能
------------------------------------------------

--------------以下是技能----------------------------------------------------


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        597,		--ID为700的Hot
        1			--Level为1
    );

    ----------------- 设置Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	
	--skill.SetNormalCoolDown(1, 2);
	
    ----------------- 设置杂项参数 ----------------------------------------

    --攻击半径，也就是攻击的有效距离
    skill.nMaxRadius        = 15 * LENGTH_BASE;
    skill.nAngleRange       = 256; 	--全方位
    --吟唱帧数
    skill.nPrepareFrames    = 0;	--瞬发
    --子弹速度
    skill.nBulletVelocity   = 0;
    --被打断的概率
    skill.nBreakRate        = 1000;
    --阵眼
	--IsFormationSkill		= true
    --框选范围 框选范围用于下面的人数判断--
    --FormationRange 			= 30	
    --范围队员人数
	--LeastFormationPopulation= 2			
      
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