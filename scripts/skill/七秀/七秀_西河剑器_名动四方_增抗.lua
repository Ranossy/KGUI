------------------------------------------------
-- �ļ���    :  ����_���ӽ���_�����ķ�.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-8-25
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ���ӽ���
-- ��������  :  �����ķ�
-- ����Ч��  :  ������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
		{nDebuffID = 320, nDebuffLevel = 1},--���������ڹ�����
		{nDebuffID = 320, nDebuffLevel = 2},
		{nDebuffID = 320, nDebuffLevel = 3},
		{nDebuffID = 320, nDebuffLevel = 4},
		{nDebuffID = 320, nDebuffLevel = 5},
		{nDebuffID = 320, nDebuffLevel = 6},
		{nDebuffID = 320, nDebuffLevel = 7},
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
		local dwSkillLevel	= skill.dwLevel
	
		skill.BindBuff(1,320,tSkillData[dwSkillLevel].nDebuffLevel)--���������ڹ�����
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
		
		----------------- ���ü������� ---------------------------------------------------------------------
		--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    --------------- ����������� ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
		-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius				= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 20 * LENGTH_BASE;						--����ʩ�����뾶
    skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
    skill.nAreaRadius				= 20 * LENGTH_BASE;
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 		skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com