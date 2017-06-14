------------------------------------------------
-- �ļ���    :  ǰ��.lua
-- ������    :  ����
-- ����ʱ��  :  2007-9-25
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��������
-- ��������  :  ǰ��
-- ����Ч��  :  ��ǰ���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData=
{
	{nDashFrame = 10},
	{nDashFrame = 12},
	{nDashFrame = 14},
	{nDashFrame = 16},
};
--�����书���ܼ��������ֵ
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
   		"skill/Quest/��ս������_����.lua",				
   		0														
   		);	
    --skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff--�����£����Ṧ
	
    ----------------- ����Cool down ---------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);
    --skill.SetNormalCoolDown(1, 572);	--����1��GCD
    --skill.SetNormalCoolDown(2, 88);    
    --skill.SetNormalCoolDown(3, 165);
	
    ----------------- ����������� ----------------------------------------  

    --�����뾶��Ҳ���ǹ�������Ч����
    --skill.nMaxRadius        = 4 * LENGTH_BASE;
    --skill.nAngleRange       = 64; 
    --����֡��
    skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�
    skill.nBulletVelocity   = 0;
    --����ϵĸ���
    skill.nBreakRate        = 1000;
    --Ӳֱ
    --skill.nStiffFrames		= 16
   
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com