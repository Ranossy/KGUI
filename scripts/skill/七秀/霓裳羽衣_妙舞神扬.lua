------------------------------------------------
-- �ļ���    :  ��������_��������.lua
-- ������    :  �ź�	
-- ����ʱ��  :  2011-4-18
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �ڹ�
-- �书��·  :  ��������
-- ��������  :  ��������
-- ����Ч��  :  ����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/skill����/����ʹ�ø���ܻ�ж�.lua")

tSkillData =
{
	{ nReviveLife = 245, 	nReviveMana = 295, 	nCostMana = 225},
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.REVIVE, 
        tSkillData[dwSkillLevel].nReviveLife,		
        tSkillData[dwSkillLevel].nReviveMana		
    );

	--ɾ��������˱��buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		9298,
		1
		);
    
	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    skill.SetPublicCoolDown(16);	--����CD
    skill.SetCheckCoolDown(1, 444);
    --skill.SetNormalCoolDown(1, 37);
	
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
    --skill.nCostMana			= 0;
	skill.nCostManaBasePercent = 1365;	-- �������ĵ�����
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 20 * LENGTH_BASE;						--����ʩ�����뾶
    skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
    skill.nMinPrepareFrames = 1;
    skill.nPrepareFrames    = 160;										--����֡��,16֡����1��
    
 	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    --skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
	local nResult = CheckCamp(player)
	if not nResult then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 3567), 4)
		return SKILL_RESULT_CODE.FAILED
	end
	return nPreResult;
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com