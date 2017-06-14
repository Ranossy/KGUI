------------------------------------------------
-- 文件名    :  前冲.lua
-- 创建人    :  刘欣
-- 创建时间  :  2007-9-25
-- 用途(模块):  武功技能
-- 武功门派  :  江湖
-- 武功类型  :  外功
-- 武功套路  :  防身武艺
-- 技能名称  :  前冲
-- 技能效果  :  向前冲刺
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData=
{
	{nDashFrame = 10},
	{nDashFrame = 12},
	{nDashFrame = 14},
	{nDashFrame = 16},
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    local bRetCode     = false;

    	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	ATTRIBUTE_TYPE.DASH_FORWARD, 
        	16, 
        	80
		);
	
      	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								
   		"skill/Quest/大战郭萌萌_蹑云.lua",				
   		0														
   		);	
    --skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff--吞日月，禁轻功
	
    ----------------- 设置Cool down ---------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);
    --skill.SetNormalCoolDown(1, 572);	--明教1秒GCD
    --skill.SetNormalCoolDown(2, 88);    
    --skill.SetNormalCoolDown(3, 165);
	
    ----------------- 设置杂项参数 ----------------------------------------  

    --攻击半径，也就是攻击的有效距离
    --skill.nMaxRadius        = 4 * LENGTH_BASE;
    --skill.nAngleRange       = 64; 
    --吟唱帧数
    skill.nPrepareFrames    = 0;
    --子弹速度
    skill.nBulletVelocity   = 0;
    --被打断的概率
    skill.nBreakRate        = 1000;
    --硬直
    --skill.nStiffFrames		= 16
   
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

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	player.Talk(GetEditorString(11, 1981), 5)
	local n = Random(1, 6)
	if n == 1 then
		if player.szName == GetEditorString(8, 1875) then
			player.Talk(GetEditorString(8, 2101), 5)
		else
			player.Talk(GetEditorString(7, 2174), 5)
		end
		
	end
	if n == 2 then
		if player.szName == GetEditorString(8, 1875) then
			player.Talk(GetEditorString(8, 2101), 5)
		else
			player.Talk(GetEditorString(7, 2175), 5)
		end
		
		
	end
	if n == 3 then
		if player.szName == GetEditorString(8, 1875) then
			player.Talk(GetEditorString(8, 2101), 5)
		else
			player.Talk(GetEditorString(5, 3856), 5)
		end
		
	end	
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com