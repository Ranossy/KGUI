--������Ե������� ǧ������ һͳ����
--�书����
--��Ʒ���߼���-ר��
--����Ч����˵���������߼���ר��
--����ǿ 2009-02-20

--------------����ķָ���-----------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
    {nHotLevel = 1},
    {nHotLevel = 2},  --���Ѷȵ�����6���ȼ�
    {nHotLevel = 3},
    {nHotLevel = 4},
    {nHotLevel = 5},
    {nHotLevel = 6}
    
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
   	skill.BindBuff(1, 1057, tSkillData[dwSkillLevel].nHotLevel)

    ----------------- ʱ����� -------------------------------------------------
    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetPublicCoolDown(16);						-- ����CD 1.5��
    skill.SetNormalCoolDown(1, 216);
    
    skill.nPrepareFrames  	= 38;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
    skill.nMaxRadius    = 6 * LENGTH_BASE;
    skill.nAngleRange   = 128; 
    skill.nBrokenRate   = PERCENT_BASE;	
    --����֡��
    --skill.nPrepareFrames    = tSkillData[dwSkillLevel].nPrepareFrames;
	          
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

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com